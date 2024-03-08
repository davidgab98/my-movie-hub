import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/intermediate_loading_screen.dart';
import 'package:my_movie_hub/src/core/routing/not_found_screen.dart';
import 'package:my_movie_hub/src/core/routing/scaffold_with_nested_navigation.dart';
import 'package:my_movie_hub/src/features/auth/session_manager/presentation/session_manager_screen.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/presentation/sign_in_screen.dart';
import 'package:my_movie_hub/src/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:my_movie_hub/src/features/home/presentation/screens/home_screen.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/screens/movie_detail_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/change_language_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:my_movie_hub/src/features/ratings/presentation/screens/ratings_screen.dart';
import 'package:my_movie_hub/src/features/watchlist/presentation/screens/watchlist_screen.dart';

enum AppRoute {
  sessionManager('/'),
  signIn('/signIn'),
  home('/home'),
  profile('/profile'),
  changeLanguage('changeLanguage'),
  favorites('/favorites'),
  watchlist('/watchlist'),
  ratings('/ratings'),
  movieDetail('movieDetail');

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
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shell A');

final goRouter = GoRouter(
  redirect: (context, state) {},
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
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              name: AppRoute.home.name,
              path: AppRoute.home.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorHomeKey,
                  name: '${AppRoute.home.name}${AppRoute.movieDetail.name}',
                  path: '${AppRoute.home.name}${AppRoute.movieDetail.path}',
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
              ],
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
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorWatchlistKey,
                  name:
                      '${AppRoute.watchlist.name}${AppRoute.movieDetail.name}',
                  path:
                      '${AppRoute.watchlist.name}${AppRoute.movieDetail.path}',
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
              ],
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
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorFavoritesKey,
                  name:
                      '${AppRoute.favorites.name}${AppRoute.movieDetail.name}',
                  path:
                      '${AppRoute.favorites.name}${AppRoute.movieDetail.path}',
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
              ],
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
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorRatingsKey,
                  name: '${AppRoute.ratings.name}${AppRoute.movieDetail.name}',
                  path: '${AppRoute.ratings.name}${AppRoute.movieDetail.path}',
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
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.sessionManager.path,
      name: AppRoute.sessionManager.name,
      builder: (context, state) => const SessionManagerScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.signIn.path,
      name: AppRoute.signIn.name,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.profile.path,
      name: AppRoute.profile.name,
      builder: (context, state) => const ProfileScreen(),
      routes: [
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoute.changeLanguage.path,
          name: AppRoute.changeLanguage.name,
          builder: (context, state) => const ChangeLanguageScreen(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

String getMovieDetailRouteName(BuildContext context) {
  final String? baseRoute =
      GoRouter.of(context).routerDelegate.currentConfiguration.last.route.name;

  return '$baseRoute${AppRoute.movieDetail.name}';
}
