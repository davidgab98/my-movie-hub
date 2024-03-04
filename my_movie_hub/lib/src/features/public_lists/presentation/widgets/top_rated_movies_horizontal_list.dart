import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/simple_movie_list.dart';
import 'package:my_movie_hub/src/features/public_lists/domain/repositories/public_lists_repository.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/public_list_section.dart';

class TopRatedMoviesHorizontalList extends StatelessWidget {
  const TopRatedMoviesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return PublicListSection(
      title: 'Top Rated',
      child: SimpleMovieList(
        fetchMovies: locator<PublicListsRepository>().getTopRatedMovies,
      ),
    );
  }
}
