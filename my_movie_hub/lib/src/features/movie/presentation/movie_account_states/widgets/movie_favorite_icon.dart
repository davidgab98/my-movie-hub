import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/metallic_icon_button.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieFavoriteIcon extends StatelessWidget {
  const MovieFavoriteIcon({
    this.size,
    super.key,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieAccountStatesCubit, MovieAccountStatesState>(
      builder: (context, state) {
        if (state.accountStates != null) {
          return MetallicIconButton(
            icon: state.accountStates!.favorite
                ? Icons.favorite
                : Icons.favorite_outline_rounded,
            baseColor: AppColors.red,
            onPressed: () =>
                context.read<MovieAccountStatesCubit>().toggleFavoritesStatus(),
          );
        } else {
          return const IconButton(
            onPressed: null,
            icon: Center(
              child: SizedBox(
                width: 20,
                child: LinearProgressIndicator(
                  color: AppColors.red,
                  minHeight: 4,
                  backgroundColor: AppColors.backgroundAPPDark,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
