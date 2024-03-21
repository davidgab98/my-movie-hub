import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/now_playing_movies_horizontal_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/popular_movies__horizontal_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/top_rated_movies_horizontal_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/trending_movies_carousel.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/upcoming_movies_horizontal_list.dart';
import 'package:ui_kit/ui_kit.dart';

//TODO: Estrenos - filtros

//TODO: Pull to refresh en android - https://github.com/flutter/flutter/issues/21820

//TODO: Error en watchlist no se añaden peliculas

//TODO: Ver casos de error

//TODO: Ordenar Widgets de Generos y Listas de Generos
//TODO: Hacer widget generico de degradado de colores (usado en appbar, reparto, y poster not found background)
//TODO: Ordenar/Revisar toda la app y ordenar codigo

//TODO: Movie y DetailedMovie DTOS con Freezed y Clases de dominio sin freezed (y así MovieDetailed puede extender de Movie)

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSpaces.gapH12,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpaces.s16),
                child: GenresDirectAccessList(),
              ),
              AppSpaces.gapH16,
              const TrendingMoviesCarousel(),
              AppSpaces.gapH16,
              const NowPlayingMoviesHorizontalList(),
              AppSpaces.gapH24,
              const TopRatedMoviesHorizontalList(),
              AppSpaces.gapH12,
              const UpcomingMoviesHorizontalList(),
              AppSpaces.gapH12,
              const PopularMoviesHorizontalList(),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}

class GenresDirectAccessList extends StatelessWidget {
  const GenresDirectAccessList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _GenreDirectAccess(genre: 'Comedy'),
          AppSpaces.gapW10,
          _GenreDirectAccess(genre: 'Drama'),
          AppSpaces.gapW10,
          _GenreDirectAccess(genre: 'Terror'),
          AppSpaces.gapW10,
          _GenreDirectAccess(genre: 'Action'),
          AppSpaces.gapW10,
          _GenreDirectAccess(genre: 'Romantic'),
          AppSpaces.gapW10,
          _GenreDirectAccess(genre: 'Indie'),
        ],
      ),
    );
  }
}

class _GenreDirectAccess extends StatelessWidget {
  const _GenreDirectAccess({required this.genre, super.key});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSpaces.s4),
      decoration: BoxDecoration(
        color: context.colors.onBackground.withOpacity(0.25),
        borderRadius: BorderRadius.circular(
          AppBorderRadius.br16,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.s16,
          vertical: AppSpaces.s8,
        ),
        color: context.colors.background.withOpacity(0.65),
        child: Text(
          genre,
          style: AppTextStyle.bodyMedium.copyWith(
            color: context.colors.onBackground,
          ),
        ),
      ),
    );
  }
}
