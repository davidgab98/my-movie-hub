import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
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
      appBar: AppBar(
        title: Text(
          'Ratings',
          style: AppTextStyle.headlineXXL,
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: AppSpaces.s12),
          icon: const Icon(
            Icons.person,
            size: 28,
          ),
          onPressed: () {},
        ),
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
