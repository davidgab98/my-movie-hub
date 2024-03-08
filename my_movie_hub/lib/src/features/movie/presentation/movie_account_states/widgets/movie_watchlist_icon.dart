import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieWatchlistIcon extends StatelessWidget {
  const MovieWatchlistIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieAccountStatesCubit, MovieAccountStatesState, bool>(
      selector: (state) => state.isInWatchlist,
      builder: (context, isInWatchlist) {
        return IconButton(
          iconSize: size,
          icon: Icon(
            isInWatchlist ? Icons.visibility : Icons.visibility_off,
            color: AppColors.blue,
            size: 28,
          ),
          onPressed: () =>
              context.read<MovieAccountStatesCubit>().toggleWatchlistStatus(),
        );
      },
    );
  }
}
