import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/metallic_icon_button.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieRatingIcon extends StatelessWidget {
  const MovieRatingIcon({
    this.size,
    super.key,
  });

  final double? size;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieAccountStatesCubit, MovieAccountStatesState, int?>(
      selector: (state) => state.rating,
      builder: (context, rating) {
        return MetallicIconButton(
          icon: rating != null ? Icons.stars_rounded : Icons.star_outline,
          baseColor: AppColors.orange,
          onPressed: () =>
              context.read<MovieAccountStatesCubit>().addRating(rating: 3),
        );
      },
    );
  }
}
