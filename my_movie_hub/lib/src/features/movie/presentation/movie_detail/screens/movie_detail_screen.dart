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
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        )
      ],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, _) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                fit: BoxFit.cover,
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
                      style: AppTextStyle.mainTitleSmall.copyWith(
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
              AppSpaces.gapH16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
                child: Divider(
                  height: 0,
                  color: AppColors.overlayDark.withOpacity(1),
                  thickness: 0.1,
                ),
              ),
              AppSpaces.gapH16,
              _MainMovieInfo(movie: movie),
              AppSpaces.gapH20,
              MovieRecommendationsList(
                movieId: movie.id,
              ),

              //TODO: Funcionalidad de compartir
              /// Credits (Fotos solo del reparto, similar a filmaffinity)
              /// Reviews
              SizedBox(height: MediaQuery.of(context).padding.bottom),
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
              if (state.movie.tagline != null &&
                  state.movie.tagline!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpaces.s16),
                  child: Text(
                    state.movie.tagline!,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
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
                'Titulo original: ${movie.originalTitle}',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'Fecha de estreno: ${movie.releaseDate}',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                state.movie.runtime != null
                    ? 'Duracion: ${state.movie.runtime?.formatDuration()}'
                    : 'Duracion: 0h 0m',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'País: ${state.movie.productionCountries != null ? state.movie.productionCountries!.map((country) => country.name ?? '').join(', ') : ''}',
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.white,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'Companies: ${state.movie.productionCompanies != null ? state.movie.productionCompanies!.map((company) => company.name ?? '').join(', ') : ''}',
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
