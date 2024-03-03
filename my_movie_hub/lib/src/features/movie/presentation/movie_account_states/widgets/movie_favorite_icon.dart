import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieFavoriteIcon extends StatelessWidget {
  const MovieFavoriteIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieAccountStatesCubit, MovieAccountStatesState, bool>(
      selector: (state) => state.isFavorite,
      builder: (context, isFavorite) {
        return IconButton(
          iconSize: size,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: AppColors.red,
          ),
          onPressed: () =>
              context.read<MovieAccountStatesCubit>().toggleFavoritesStatus(),
        );
      },
    );
  }
}
