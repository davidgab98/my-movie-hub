import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushNamed(AppRoute.movieDetail.name, extra: movie),
      tileColor: AppColors.secondary.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: const Icon(Icons.movie_creation),
      title: Text(
        movie.title,
      ),
      subtitle: Text(movie.voteAverage.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.visibility)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
