import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_item/movie_item_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_item/movie_item_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_account_states_icon_button.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_favorite_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_rate_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_watchlist_icon.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieListTile extends StatelessWidget {
  MovieListTile({
    required this.movie,
    super.key,
  });

  final Movie movie;
  final GlobalKey backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieItemCubit(
        movie: movie,
        eventBus: locator<IEventBus>(),
        movieRepository: locator<MovieRepository>(),
      ),
      child: GestureDetector(
        onTap: () => context.pushNamed(AppRoute.movieDetail.name, extra: movie),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: AspectRatio(
            aspectRatio: 16 / 7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Flow(
                    delegate: _ParallaxFlowDelegate(
                      scrollable: Scrollable.of(context)!,
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
                  // const Positioned(
                  //   right: 0,
                  //   child: _IconButton(),
                  // ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
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
              ),
            ),
          ),
        ),
      ),
    );
    // return Card(
    //   elevation: 1,
    //   color: const Color(0xFF2D2F41).withOpacity(0.8),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppSpaces.s6),
    //   ),
    //   child: ListTile(
    //     onTap: () => context.pushNamed(AppRoute.movieDetail.name, extra: movie),
    //     contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    //     leading:
    //         Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
    //     title: Text(
    //       movie.title,
    //       style: AppTextStyle.headlineMedium.copyWith(
    //         color: const Color(0xFFE0E0E0),
    //       ),
    //     ),
    //     subtitle: Text(
    //       movie.voteAverage.toString(),
    //       style: AppTextStyle.bodyMedium.copyWith(
    //         color: const Color(0xFFE0E0E0),
    //       ),
    //     ),
    //     trailing: MovieAccountStatesIconButton(movieId: movie.id),
    //   ),
    // );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieItemCubit, MovieItemState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if ((state.accountStatesStatus.isInitial ||
                    state.accountStatesStatus.isError) &&
                state.movie.accountStates == null) {
              context.read<MovieItemCubit>().getMovieAccountStates();
            }
            showMovieAccountStatesModalBottomSheet(
              context: context,
              cubit: BlocProvider.of<MovieItemCubit>(context),
            );
          },
          icon: ClipOval(
            child: Container(
              padding: const EdgeInsets.all(1),
              color: Colors.blueGrey.shade700,
              child: const Icon(
                Icons.more_vert,
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  void showMovieAccountStatesModalBottomSheet({
    required BuildContext context,
    required MovieItemCubit cubit,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext modalContext) {
        return BlocProvider.value(
          value: cubit,
          child: BlocBuilder<MovieItemCubit, MovieItemState>(
            builder: (context, state) {
              if (state.movie.accountStates != null) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _MovieFavoriteIcon(
                        isFavorite: state.movie.accountStates!.favorite,
                      ),
                      _MovieWatchlistIcon(
                        isInWatchlist: state.movie.accountStates!.watchlist,
                      ),
                      const _MovieRateIcon(),
                    ],
                  ),
                );
              }
              return Wrap(
                children: <Widget>[
                  Align(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const MMHCircularProgressIndicator(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _MovieFavoriteIcon extends StatelessWidget {
  const _MovieFavoriteIcon({
    this.size,
    this.isFavorite = false,
    super.key,
  });

  final double? size;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        color: AppColors.red,
      ),
      onPressed: () => context.read<MovieItemCubit>().toggleFavoritesStatus(),
    );
  }
}

class _MovieWatchlistIcon extends StatelessWidget {
  const _MovieWatchlistIcon({
    this.size,
    this.isInWatchlist = false,
    super.key,
  });

  final double? size;
  final bool isInWatchlist;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      icon: Icon(
        isInWatchlist ? Icons.visibility : Icons.visibility_off,
        color: AppColors.blue,
      ),
      onPressed: () => context.read<MovieItemCubit>().toggleWatchlistStatus(),
    );
  }
}

class _MovieRateIcon extends StatelessWidget {
  const _MovieRateIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      icon: const Icon(
        Icons.watch_later,
        color: AppColors.blue,
      ),
      onPressed: () => context.read<MovieItemCubit>().toggleWatchlistStatus(),
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
