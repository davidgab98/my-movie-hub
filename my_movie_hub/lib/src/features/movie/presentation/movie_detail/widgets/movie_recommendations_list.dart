import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/simple_movie_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/public_list_section.dart';

class MovieRecommendationsList extends StatelessWidget {
  const MovieRecommendationsList({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return PublicListSection(
      title: 'Te podría interesar',
      child: SimpleMovieList(
        fetchMoviesByMovieId: locator<MovieRepository>().getRecommendations,
        movieId: movieId,
      ),
    );
  }
}
