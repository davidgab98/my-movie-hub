import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/favorites/application/favorites_list_cubit.dart';
import 'package:my_movie_hub/src/features/favorites/application/favorites_list_state.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/favorites/presentation/widgets/favorites_list.dart';
import 'package:ui_kit/ui_kit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.s16),
        child: BlocProvider(
          create: (_) => FavoritesListCubit(
            favoritesRepository: locator<FavoritesRepository>(),
          )..getFavoriteMovies(),
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesListCubit, FavoritesListState>(
      builder: (context, state) {
        if (state.status.isLoaded) {
          if (state.movies.isNotEmpty) {
            return FavoritesList(
              movies: state.movies,
            );
          } else {
            return const Text('No tienes favoritas');
          }
        } else if (state.status.isInitial || state.status.isLoading) {
          return const Center(
            child: MMHCircularProgressIndicator(),
          );
        } else {
          return const Text('Error');
          // return ErrorDataReloadPlaceholder(
          //   onReload: context.read<AlertsCubit>().getNotifications,
          // );
        }
      },
    );
  }
}
