import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/intermediate_loading_screen.dart';
import 'package:my_movie_hub/src/core/routing/not_found_screen.dart';
import 'package:my_movie_hub/src/core/routing/scaffold_with_nested_navigation.dart';
import 'package:my_movie_hub/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:my_movie_hub/src/features/home/presentation/screens/home_screen.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/screens/movie_detail_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:my_movie_hub/src/features/ratings/presentation/screens/ratings_screen.dart';
import 'package:my_movie_hub/src/features/sign_in/presentation/sign_in_screen.dart';
import 'package:my_movie_hub/src/features/start_app/presentation/start_app_screen.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:my_movie_hub/src/features/watchlist/presentation/screens/watchlist_screen.dart';

enum AppRoute {
  startApp('/'),
  signIn('/signIn'),
  home('/home'),
  profile('/profile'),
  favorites('/favorites'),
  watchlist('/watchlist'),
  ratings('/ratings'),
  movieDetail('/movieDetail'),
  a('/a'),
  b('/b');

  final String path;
  const AppRoute(this.path);
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorFavoritesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Favorites');
final _shellNavigatorWatchlistKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Watchlist');
final _shellNavigatorRatingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Ratings');
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
              name: AppRoute.home.name,
              path: AppRoute.home.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorWatchlistKey,
          routes: [
            GoRoute(
              name: AppRoute.watchlist.name,
              path: AppRoute.watchlist.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: WatchlistScreen(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFavoritesKey,
          routes: [
            GoRoute(
              name: AppRoute.favorites.name,
              path: AppRoute.favorites.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FavoritesScreen(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRatingsKey,
          routes: [
            GoRoute(
              name: AppRoute.ratings.name,
              path: AppRoute.ratings.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RatingsScreen(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.movieDetail.path,
      name: AppRoute.movieDetail.name,
      builder: (context, state) {
        if (state.extra == null || state.extra is! Movie) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pop();
          });
          return const IntermediateLoadingScreen();
        }

        return MovieDetailScreen(movie: state.extra! as Movie);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.profile.path,
      name: AppRoute.profile.name,
      builder: (context, state) => const ProfileScreen(),
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
