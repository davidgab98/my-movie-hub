import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/metallic_icon_button.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieRatingIcon extends StatelessWidget {
  const MovieRatingIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return PopupMenuButton<int>(
          elevation: 1,
          color: context.colors.background,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br24),
            side: BorderSide(
              color: context.colors.onBackground.withOpacity(0.5),
              width: 0.5,
            ),
          ),
          onSelected: (rating) {
            if (rating > 0) {
              context
                  .read<MovieDetailCubit>()
                  .addRating(rating: rating.toDouble());
            } else {
              context.read<MovieDetailCubit>().removeRating();
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            for (int i = 0; i <= 10; i++)
              PopupMenuItem<int>(
                value: i,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor:
                        context.colors.primary.withOpacity(0.5),
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: i == state.movie.accountStates?.rated?.toInt()
                      ? () {}
                      : null,
                  child: Center(
                    child: Text(
                      i == 0 ? 'ratings.clearRating'.tr() : '$i ✯',
                      style: AppTextStyle.titleMedium.copyWith(
                        color: i == 0
                            ? context.colors.error
                            : i == state.movie.accountStates?.rated?.toInt()
                                ? context.colors.primary
                                : Colors.amber,
                      ),
                    ),
                  ),
                ),
              ),
          ],
          child: MetallicIconButton(
            icon: state.movie.accountStates != null
                ? state.movie.accountStates!.rated != null
                    ? Icons.star
                    : Icons.star_outline
                : null,
            baseColor: Colors.amber,
          ),
        );
      },
    );
  }
}
