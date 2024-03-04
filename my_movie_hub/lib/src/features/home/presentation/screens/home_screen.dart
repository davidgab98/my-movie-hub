import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/now_playing_movies_horizontal_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/popular_movies__horizontal_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/top_rated_movies_horizontal_list.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/trending_movies_carousel.dart';
import 'package:my_movie_hub/src/features/public_lists/presentation/widgets/upcoming_movies_horizontal_list.dart';
import 'package:ui_kit/ui_kit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'appTitle'.tr(),
          style: AppTextStyle.headlineXXL,
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: AppSpaces.s12),
          icon: const Icon(
            Icons.person,
            size: 28,
          ),
          onPressed: () {},
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSpaces.gapH12,
              _GenresDirectAccessList(),
              AppSpaces.gapH16,
              TrendingMoviesCarousel(),
              AppSpaces.gapH16,
              NowPlayingMoviesHorizontalList(),
              AppSpaces.gapH12,
              TopRatedMoviesHorizontalList(),
              AppSpaces.gapH12,
              UpcomingMoviesHorizontalList(),
              AppSpaces.gapH12,
              PopularMoviesHorizontalList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenresDirectAccessList extends StatelessWidget {
  const _GenresDirectAccessList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AppSpaces.gapW16,
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
          AppSpaces.gapW16,
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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.s16,
        ),
        visualDensity: VisualDensity.compact,
        backgroundColor: Colors.transparent,
        side: const BorderSide(
          color: AppColors.black2,
          width: 0.5,
        ),
      ),
      child: Text(
        genre,
        style: AppTextStyle.bodyLarge.copyWith(
          color: AppColors.black2,
        ),
      ),
      onPressed: () {},
    );
  }
}
