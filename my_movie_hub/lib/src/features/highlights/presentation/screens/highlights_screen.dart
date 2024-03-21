import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:my_movie_hub/src/features/ratings/presentation/screens/ratings_screen.dart';
import 'package:ui_kit/ui_kit.dart';

class HighlightsScreen extends StatelessWidget {
  const HighlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: MainAppBar(
            title: 'highlights.mainTitle'.tr(),
            leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
          ),
          bottom: TabBar(
            labelStyle: AppTextStyle.titleLarge,
            labelColor: context.colors.onPrimary,
            unselectedLabelColor: Colors.blueGrey,
            indicatorColor: Colors.blueGrey,
            tabs: [
              Tab(text: 'favorites.mainTitle'.tr()),
              Tab(text: 'ratings.mainTitle'.tr()),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FavoritesScreen(),
            RatingsScreen(),
          ],
        ),
      ),
    );
  }
}
