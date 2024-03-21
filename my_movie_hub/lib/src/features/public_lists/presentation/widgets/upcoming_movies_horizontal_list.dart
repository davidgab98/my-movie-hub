import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/simple_movie_list.dart';
import 'package:my_movie_hub/src/features/public_lists/domain/repositories/public_lists_repository.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/public_list_section.dart';

class UpcomingMoviesHorizontalList extends StatelessWidget {
  const UpcomingMoviesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return PublicListSection(
      title: 'publicLists.upcomingTitle'.tr(),
      child: SimpleMovieList(
        fetchMovies: locator<PublicListsRepository>().getUpcomingMovies,
      ),
    );
  }
}
