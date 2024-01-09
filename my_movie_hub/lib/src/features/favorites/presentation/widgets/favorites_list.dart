import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/features/favorites/application/favorites_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:ui_kit/ui_kit.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({required this.movies, super.key});

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary,
      strokeWidth: 1,
      onRefresh: context.read<FavoritesListCubit>().getFavoriteMovies,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Text(movies[index].title);
        },
      ),
    );
  }
}
