import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/not_found_screen.dart';
import 'package:my_movie_hub/src/features/home/presentation/screens/home_screen.dart';

enum AppRoute {
  home('/');

  final String path;
  const AppRoute(this.path);
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  redirect: (context, state) {
    //TODO: Implement navigation conditions
  },
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
