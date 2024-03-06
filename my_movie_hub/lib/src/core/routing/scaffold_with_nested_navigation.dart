import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_kit/ui_kit.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.3),
                  AppColors.secondary.withOpacity(0.3),
                  AppColors.tertiary.withOpacity(0.3),
                ],
                stops: const [0.0, 0.75, 1.0],
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
              elevation: 1,
              iconSize: 25,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    navigationShell.currentIndex == 0
                        ? Icons.home
                        : Icons.home_outlined,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    navigationShell.currentIndex == 1
                        ? Icons.visibility
                        : Icons.visibility_outlined,
                  ),
                  label: 'Watchlist',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    navigationShell.currentIndex == 2
                        ? Icons.favorite
                        : Icons.favorite_outline,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    navigationShell.currentIndex == 3
                        ? Icons.star
                        : Icons.star_outline,
                  ),
                  label: 'Ratings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
