import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/simple_movie_carousel.dart';
import 'package:my_movie_hub/src/features/public_lists/domain/repositories/public_lists_repository.dart';

class TrendingMoviesCarousel extends StatelessWidget {
  const TrendingMoviesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SimpleMovieCarousel(
        fetchMovies: locator<PublicListsRepository>().getTrendingMovies,
      ),
    );
  }
}
