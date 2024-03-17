import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        getMovieDetailRouteName(context),
        extra: movie,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
