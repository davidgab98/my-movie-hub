import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
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
                child: DecadeDirectAccessList(),
              ),
              AppSpaces.gapH12,
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

class DecadeDirectAccessList extends StatelessWidget {
  const DecadeDirectAccessList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _DecadeDirectAccess(genre: "2020's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "2010's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "2000's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "90's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "80's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "70's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "60's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "50's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "40's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "30's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "20's"),
          AppSpaces.gapW10,
          _DecadeDirectAccess(genre: "10's"),
        ],
      ),
    );
  }
}

class _DecadeDirectAccess extends StatelessWidget {
  const _DecadeDirectAccess({required this.genre, super.key});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSpaces.s4),
      decoration: BoxDecoration(
        color: context.colors.onSurface.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(
          AppBorderRadius.br16,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.s16,
          vertical: AppSpaces.s8,
        ),
        color: context.colors.surface.withValues(alpha: 0.65),
        child: Text(
          genre,
          style: AppTextStyle.bodyMedium.copyWith(
            color: context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}
