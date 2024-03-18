import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/metallic_icon_button.dart';

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
        return MetallicIconButton(
          icon: state.movie.accountStates != null
              ? state.movie.accountStates!.rating != null
                  ? Icons.star
                  : Icons.star_outline
              : null,
          baseColor: Colors.amber,
          onPressed: () {},
        );
      },
    );
  }
}
