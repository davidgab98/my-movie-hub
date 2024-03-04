import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/favorites/application/favorites_list_cubit.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/complex_movie_list.dart';
import 'package:ui_kit/ui_kit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Favorites',
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<ComplexMovieListCubit>(
        create: (context) => FavoriteListCubit(
          favoritesRepository: locator<FavoritesRepository>(),
          eventBus: locator<IEventBus>(),
        )..loadMovies(),
        child: const SafeArea(
          child: ComplexMovieList(),
        ),
      ),
    );
  }
}
