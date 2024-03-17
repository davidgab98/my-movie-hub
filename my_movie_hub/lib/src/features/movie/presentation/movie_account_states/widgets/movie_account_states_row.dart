import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_account_states/movie_account_states_cubit.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_favorite_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_rate_icon.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_watchlist_icon.dart';

class MovieAccountStatesRow extends StatelessWidget {
  const MovieAccountStatesRow({
    required this.movie,
    this.accountStates,
    super.key,
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MovieFavoriteIcon(),
          MovieWatchlistIcon(),
          MovieRatingIcon(),
        ],
      ),
    );
  }
}
