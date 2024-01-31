import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de película ${movie.id}'),
      ),
      body: BlocProvider<MovieDetailCubit>(
        create: (context) => MovieDetailCubit(
          movie: movie,
          movieRepository: locator<MovieRepository>(),
        )..getMovieDetails(),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.movie.id.toString()),
              Text(state.movie.title),
              Text(state.movie.originalLanguage),
              Text(state.movie.status ?? ''),
              Text(state.movie.revenue?.toString() ?? ''),
              Text(state.movie.tagline ?? ''),
            ],
          ),
        );
      },
    );
  }
}
