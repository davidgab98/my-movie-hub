import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieListTileImage extends StatelessWidget {
  MovieListTileImage({
    required this.movie,
    super.key,
  });

  final Movie movie;
  final GlobalKey backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(getMovieDetailRouteName(context), extra: movie),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.br16),
            child: Stack(
              children: [
                if (movie.posterPath.isNotEmpty)
                  Flow(
                    delegate: _ParallaxFlowDelegate(
                      scrollable: Scrollable.of(context),
                      listItemContext: context,
                      backgroundImageKey: backgroundImageKey,
                    ),
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        key: backgroundImageKey,
                        fit: BoxFit.cover,
                      ),
                    ],
                  )
                else
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: AppSpaces.s20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withOpacity(0.3),
                          AppColors.secondary.withOpacity(0.2),
                          AppColors.tertiary.withOpacity(0.1),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'movieItem.posterNotFound'.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: context.colors.outline.withOpacity(0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.6, 0.95],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: AppTextStyle.headlineXLSmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        movie.overview,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(
          0.0,
          childRect.top,
        ),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
