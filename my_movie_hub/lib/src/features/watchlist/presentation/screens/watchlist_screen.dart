import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/complex_movie_list.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_cubit.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Watchlist',
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<ComplexMovieListCubit>(
        create: (context) => WatchlistCubit(
          watchlistRepository: locator<WatchlistRepository>(),
          eventBus: locator<IEventBus>(),
        )..loadMovies(),
        child: const SafeArea(
          bottom: false,
          child: ComplexMovieList(),
        ),
      ),
    );
  }
}
