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
        borderRadius: BorderRadius.circular(AppBorderRadius.br8),
        child: movie.posterPath.isNotEmpty
            ? Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              )
            : Container(
                padding: const EdgeInsets.all(AppSpaces.s16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.3),
                      AppColors.secondary.withOpacity(0.2),
                      AppColors.tertiary.withOpacity(0.1),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      height: kToolbarHeight / 3,
                      image: AssetImage(
                        'assets/pngs/mmh_logo.png',
                      ),
                    ),
                    Text(
                      'Poster not found',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: context.colors.outline.withOpacity(0.75),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      movie.title.toUpperCase(),
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: context.colors.onBackground.withOpacity(0.75),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
