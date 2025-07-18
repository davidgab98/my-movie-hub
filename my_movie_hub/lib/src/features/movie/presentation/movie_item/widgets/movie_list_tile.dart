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
    return GestureDetector(
      onTap: () =>
          context.pushNamed(getMovieDetailRouteName(context), extra: movie),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        title: Text(
          movie.title,
          style:
              AppTextStyle.titleSmall.copyWith(color: context.colors.onSurface),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
