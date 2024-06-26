import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/routing/intermediate_loading_screen.dart';
import 'package:my_movie_hub/src/core/routing/not_found_screen.dart';
import 'package:my_movie_hub/src/core/routing/scaffold_with_nested_navigation.dart';
import 'package:my_movie_hub/src/features/auth/session_manager/presentation/session_manager_screen.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/presentation/sign_in_screen.dart';
import 'package:my_movie_hub/src/features/highlights/presentation/screens/highlights_screen.dart';
import 'package:my_movie_hub/src/features/home/presentation/screens/home_screen.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/screens/movie_detail_screen.dart';
import 'package:my_movie_hub/src/features/premieres/presentation/premieres_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/about_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/change_language_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/change_theme_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/help_and_feedback_screen.dart';
import 'package:my_movie_hub/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:my_movie_hub/src/features/search/presentation/screens/search_screen.dart';
import 'package:my_movie_hub/src/features/watchlist/presentation/screens/watchlist_screen.dart';

enum AppRoute {
  sessionManager('/'),
  signIn('/signIn'),
  home('/home'),
  search('/search'),
  premieres('/premieres'),
  watchlist('/watchlist'),
  highlights('/highlights'),
  movieDetail('movieDetail'),
  profile('/profile'),
  changeLanguage('changeLanguage'),
  changeTheme('changeTheme'),
  helpAndFeedback('helpAndFeedback'),
  about('about');

  final String path;
  const AppRoute(this.path);
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Home');
final _shellNavigatorSearchKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Search');
final _shellNavigatorPremieresKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Premiere Calendar');
final _shellNavigatorWatchlistKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Watchlist');
final _shellNavigatorHighlightsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell Highlights');

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
          navigatorKey: _shellNavigatorSearchKey,
          routes: [
            GoRoute(
              name: AppRoute.search.name,
              path: AppRoute.search.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorSearchKey,
                  name: '${AppRoute.search.name}${AppRoute.movieDetail.name}',
                  path: '${AppRoute.search.name}${AppRoute.movieDetail.path}',
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
          navigatorKey: _shellNavigatorPremieresKey,
          routes: [
            GoRoute(
              name: AppRoute.premieres.name,
              path: AppRoute.premieres.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PremieresScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorPremieresKey,
                  name:
                      '${AppRoute.premieres.name}${AppRoute.movieDetail.name}',
                  path:
                      '${AppRoute.premieres.name}${AppRoute.movieDetail.path}',
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
          navigatorKey: _shellNavigatorHighlightsKey,
          routes: [
            GoRoute(
              name: AppRoute.highlights.name,
              path: AppRoute.highlights.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HighlightsScreen(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: _shellNavigatorHighlightsKey,
                  name:
                      '${AppRoute.highlights.name}${AppRoute.movieDetail.name}',
                  path:
                      '${AppRoute.highlights.name}${AppRoute.movieDetail.path}',
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
          path: AppRoute.changeTheme.path,
          name: AppRoute.changeTheme.name,
          builder: (context, state) => const ChangeThemeScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoute.changeLanguage.path,
          name: AppRoute.changeLanguage.name,
          builder: (context, state) => const ChangeLanguageScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoute.helpAndFeedback.path,
          name: AppRoute.helpAndFeedback.name,
          builder: (context, state) => const HelpAndFeedbackScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: AppRoute.about.path,
          name: AppRoute.about.name,
          builder: (context, state) => const AboutScreen(),
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
