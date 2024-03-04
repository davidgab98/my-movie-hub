import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
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
      appBar: AppBar(
        title: const Text('Favoritas'),
        leading: IconButton(
          padding: const EdgeInsets.only(left: AppSpaces.s12),
          icon: const Icon(
            Icons.person,
            size: 28,
          ),
          onPressed: () {},
        ),
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
