import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/complex_movie_list.dart';
import 'package:my_movie_hub/src/features/ratings/application/ratings_cubit.dart';
import 'package:my_movie_hub/src/features/ratings/domain/repositories/ratings_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Ratings',
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<ComplexMovieListCubit>(
        create: (context) => RatingsCubit(
          ratingsRepository: locator<RatingsRepository>(),
          eventBus: locator<IEventBus>(),
        )..loadMovies(),
        child: const SafeArea(
          child: ComplexMovieList(),
        ),
      ),
    );
  }
}
