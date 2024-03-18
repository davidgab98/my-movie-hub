import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/metallic_icon_button.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieWatchlistIcon extends StatelessWidget {
  const MovieWatchlistIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return MetallicIconButton(
          icon: state.movie.accountStates != null
              ? state.movie.accountStates!.watchlist
                  ? Icons.visibility
                  : Icons.visibility_outlined
              : null,
          baseColor: context.colors.tertiary,
          onPressed: () =>
              context.read<MovieDetailCubit>().toggleWatchlistStatus(),
        );
      },
    );
  }
}
