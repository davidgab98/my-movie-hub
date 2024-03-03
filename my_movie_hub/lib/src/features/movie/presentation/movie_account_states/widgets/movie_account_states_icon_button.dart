import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_favorite_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_rate_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_watchlist_icon.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieAccountStatesIconButton extends StatelessWidget {
  const MovieAccountStatesIconButton({
    required this.movie,
    super.key,
    this.accountStates,
  });

  final Movie movie;
  final AccountStates? accountStates;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieAccountStatesCubit(
        movie: movie,
        accountStates: accountStates,
        movieRepository: locator<MovieRepository>(),
        eventBus: locator<IEventBus>(),
      ),
      child: _IconButton(
        movieId: movie.id,
        accountStates: accountStates,
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.movieId,
    super.key,
    this.accountStates,
  });

  final int movieId;
  final AccountStates? accountStates;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieAccountStatesCubit, MovieAccountStatesState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if ((state.getAccountStatesStatus.isInitial ||
                    state.getAccountStatesStatus.isError) &&
                accountStates == null) {
              context.read<MovieAccountStatesCubit>().getAccountStates(movieId);
            }
            showMovieAccountStatesModalBottomSheet(
              context: context,
              cubit: BlocProvider.of<MovieAccountStatesCubit>(context),
            );
          },
          icon: ClipOval(
            child: Container(
              padding: const EdgeInsets.all(1),
              color: Colors.blueGrey.shade700,
              child: !state.getAccountStatesStatus.isLoading
                  ? const Icon(
                      Icons.more_vert,
                      color: AppColors.white,
                    )
                  : const MMHCircularProgressIndicator(
                      color: AppColors.white,
                      size: 20,
                    ),
            ),
          ),
        );
      },
    );
  }

  void showMovieAccountStatesModalBottomSheet({
    required BuildContext context,
    required MovieAccountStatesCubit cubit,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext modalContext) {
        return BlocProvider.value(
          value: cubit,
          child: BlocBuilder<MovieAccountStatesCubit, MovieAccountStatesState>(
            builder: (context, state) {
              if (state.getAccountStatesStatus.isLoaded) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MovieFavoriteIcon(size: 23),
                      MovieWatchlistIcon(),
                      MovieRatingIcon(),
                    ],
                  ),
                );
              }
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const MMHCircularProgressIndicator(),
              );
            },
          ),
        );
      },
    );
  }
}
