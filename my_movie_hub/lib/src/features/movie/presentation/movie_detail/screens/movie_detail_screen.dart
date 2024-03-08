import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/utils/time_utils.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_account_states/widgets/movie_account_states_row.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/movie_recommendations_list.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/overall_rating_stars.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MovieDetailCubit(
          movie: movie,
          movieRepository: locator<MovieRepository>(),
        )..getMovieDetails(),
        child: _Body(movie: movie),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Movie movie;

  const _Body({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _DetailsHeader(movie: movie),
        _DetailsBody(movie: movie),
      ],
    );
  }
}

class _DetailsHeader extends StatelessWidget {
  const _DetailsHeader({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      expandedHeight: MediaQuery.of(context).size.height * 0.33,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: 'movie-hero-${movie.id}',
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.backgroundAPPDark,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpaces.s16),
                  child: FittedBox(
                    child: Text(
                      movie.title,
                      style: AppTextStyle.mainTitleMedium.copyWith(
                        color: AppColors.overlayDark,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  const _DetailsBody({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Text(
                '${DateTime.parse(movie.releaseDate).year} | Accion, Drama, Comedy | ${state.movie.runtime?.formatDuration() ?? '0h 0m'}',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.black2,
                ),
              ),
              AppSpaces.gapH20,
              OverallRatingStars(
                voteAverage: movie.voteAverage,
                voteCount: movie.voteCount.toDouble(),
              ),
              AppSpaces.gapH20,
              MovieAccountStatesRow(movie: movie),
              AppSpaces.gapH32,
              _MainMovieInfo(movie: movie),
              AppSpaces.gapH20,
              MovieRecommendationsList(
                movieId: movie.id,
              ),

              /// Titulo original
              /// Credits (Fotos solo del reparto, similar a filmaffinity)
              /// Reviews
              /// País
              AppSpaces.gapH32,
            ],
          ),
        );
      },
    );
  }
}

class _MainMovieInfo extends StatelessWidget {
  const _MainMovieInfo({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.movie.tagline ?? '',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              AppSpaces.gapH20,
              Text(
                movie.overview,
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.justify,
              ),
              AppSpaces.gapH20,
              if (state.movie.genres != null)
                Wrap(
                  spacing: 20,
                  children: state.movie.genres!
                      .map(
                        (genre) => Chip(
                          label: Text(
                            genre.name ?? '',
                            style: AppTextStyle.bodyMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              AppSpaces.gapH20,
              Text(
                state.movie.runtime != null
                    ? 'Duration: ${state.movie.runtime?.formatDuration()}'
                    : 'Duration: 0h 0m',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'Release date: ${movie.releaseDate}',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
