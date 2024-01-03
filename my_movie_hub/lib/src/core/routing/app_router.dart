import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/not_found_screen.dart';
import 'package:my_movie_hub/src/core/routing/scaffold_with_nested_navigation.dart';
import 'package:my_movie_hub/src/features/home/presentation/screens/home_screen.dart';
import 'package:my_movie_hub/src/features/sign_in/presentation/sign_in_screen.dart';
import 'package:my_movie_hub/src/features/start_app/presentation/start_app_screen.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';

enum AppRoute {
  startApp('/'),
  signIn('/signIn'),
  home('/home'),
  a('/a'),
  b('/b');

  final String path;
  const AppRoute(this.path);
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shell A');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shell B');

final goRouter = GoRouter(
  redirect: (context, state) {
    //TODO: Implement navigation conditions
  },
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              name: AppRoute.a.name,
              path: AppRoute.a.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ScreenA(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              name: AppRoute.b.name,
              path: AppRoute.b.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ScreenB(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.signIn.path,
      name: AppRoute.signIn.name,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.startApp.path,
      name: AppRoute.startApp.name,
      builder: (context, state) => const StartAppScreen(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(locator<UserCubit>().state.user.name),
          Text(locator<UserCubit>().state.user.id.toString()),
          Text(locator<UserCubit>().state.user.username),
          Text(locator<UserCubit>().state.user.iso31661 ?? ''),
          Text(locator<UserCubit>().state.user.iso6391 ?? ''),
          Text(locator<UserCubit>().state.user.includeAdult.toString()),
          Text(locator<UserCubit>().state.user.avatar?.avatarImagePath ?? ''),
          Text(locator<UserCubit>().state.user.avatar?.gravatarHash ?? ''),
          if (locator<UserCubit>().state.user.avatar?.gravatarHash != null)
            Image.network(
              'https://www.gravatar.com/avatar/${locator<UserCubit>().state.user.avatar!.gravatarHash!}',
            ),
          if (locator<UserCubit>().state.user.avatar?.avatarImagePath != null)
            Image.network(
              'https://image.tmdb.org/t/p/original${locator<UserCubit>().state.user.avatar!.avatarImagePath!}',
            ),
        ],
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B'),
      ),
    );
  }
}
