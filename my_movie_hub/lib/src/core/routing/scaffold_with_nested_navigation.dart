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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpaces.s8),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSpaces.s20),
            topRight: Radius.circular(AppSpaces.s20),
            bottomLeft: Radius.circular(AppSpaces.s40),
            bottomRight: Radius.circular(AppSpaces.s40),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: ColoredBox(
              color: AppColors.white.withOpacity(0.25),
              child: BottomNavigationBar(
                backgroundColor: AppColors.black.withOpacity(0.55),
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
                elevation: 0,
                iconSize: 25,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                //showSelectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: Colors.white,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 1
                          ? Icons.saved_search_rounded
                          : Icons.search_outlined,
                      color: Colors.white,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 2
                          ? Icons.movie_filter_rounded
                          : Icons.movie_filter_outlined,
                      color: Colors.white,
                    ),
                    label: 'Premieres',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 3
                          ? Icons.visibility
                          : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                    label: 'Watchlist',
                  ),
                  BottomNavigationBarItem(
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          navigationShell.currentIndex == 4
                              ? Icons.favorite_outline
                              : Icons.favorite_outline,
                          color: Colors.white,
                        ),
                        Icon(
                          navigationShell.currentIndex == 4
                              ? Icons.star
                              : Icons.star_outline,
                          color: Colors.white,
                          size: 12,
                        ),
                      ],
                    ),
                    label: 'F&R',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
