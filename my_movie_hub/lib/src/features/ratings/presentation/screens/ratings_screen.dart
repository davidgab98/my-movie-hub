import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/complex_movie_list.dart';
import 'package:my_movie_hub/src/features/ratings/application/ratings_cubit.dart';
import 'package:my_movie_hub/src/features/ratings/domain/repositories/ratings_repository.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<ComplexMovieListCubit>(
      create: (context) => RatingsCubit(
        ratingsRepository: locator<RatingsRepository>(),
        eventBus: locator<IEventBus>(),
      )..loadMovies(),
      child: const ComplexMovieList(),
    );
  }

  // To keep the screen alive on tab change
  @override
  bool get wantKeepAlive => true;
}
