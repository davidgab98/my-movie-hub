// watchlist_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/features/movie_list/application/movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/movie_list_screen.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_cubit.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: BlocProvider<MovieListCubit>(
        create: (context) => WatchlistCubit(
          watchlistRepository: locator<WatchlistRepository>(),
          eventBus: locator<IEventBus>(),
        )..loadMovies(),
        child: const SafeArea(
          child: MovieList(),
        ),
      ),
    );
  }
}
