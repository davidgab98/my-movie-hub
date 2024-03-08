import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_item/movie_item_cubit.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieItemCubit(
        movie: movie,
        eventBus: locator<IEventBus>(),
        movieRepository: locator<MovieRepository>(),
      ),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoute.movieDetail.name, extra: movie);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppBorderRadius.br16),
          child: Hero(
            tag: 'movie-hero-${movie.id}',
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
