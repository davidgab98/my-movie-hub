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
              AppSpaces.gapH24,
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
