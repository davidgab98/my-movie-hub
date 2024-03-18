import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/enums/movie_genres.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/utils/time_utils.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_detail/widgets/account_states_icons/movie_account_states_row.dart';
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
          eventBus: locator<IEventBus>(),
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
        ),
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
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      context.colors.background,
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
                      movie.title.toUpperCase(),
                      style: AppTextStyle.mainTitleMedium.copyWith(
                        color: context.colors.onBackground,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
                child: Text(
                  '${DateTime.parse(movie.releaseDate).year} | ${movie.genres.map((genre) => genre.toTranslatedString()).join(', ')} | ${state.movie.runtime?.formatDuration() ?? '0h 0m'}',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: context.colors.outline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AppSpaces.gapH16,
              OverallRatingStars(
                voteAverage: movie.voteAverage,
                voteCount: movie.voteCount.toDouble(),
              ),
              AppSpaces.gapH20,
              const MovieAccountStatesRow(),
              AppSpaces.gapH24,
              Divider(
                indent: AppSpaces.s16,
                endIndent: AppSpaces.s16,
                height: 0,
                color: context.colors.onBackground.withOpacity(1),
                thickness: 0.1,
              ),
              AppSpaces.gapH16,
              _MainMovieInfo(movie: movie),
              AppSpaces.gapH20,
              const Align(
                alignment: Alignment.centerLeft,
                child: MovieCredits(),
              ),
              AppSpaces.gapH24,
              MovieRecommendationsList(
                movieId: movie.id,
              ),
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
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                ),
              Text(
                movie.overview,
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.onBackground,
                ),
                textAlign: TextAlign.justify,
              ),
              AppSpaces.gapH20,
              _GenresWrapList(genres: movie.genres),
              AppSpaces.gapH20,
              Text(
                'Titulo original',
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
              Text(
                movie.originalTitle,
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.outline,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'Año',
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
              Text(
                '${DateTime.parse(movie.releaseDate).year}',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.outline,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'Duración',
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
              Text(
                state.movie.runtime != null
                    ? state.movie.runtime!.formatDuration()
                    : '0h 0m',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.outline,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'País',
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
              Text(
                state.movie.productionCountries != null
                    ? state.movie.productionCountries!
                        .map((country) => country.name ?? '')
                        .join(', ')
                    : '',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.outline,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'Compañías',
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
              Text(
                state.movie.productionCompanies != null
                    ? state.movie.productionCompanies!
                        .map((company) => company.name ?? '')
                        .join(', ')
                    : '',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.outline,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GenresWrapList extends StatelessWidget {
  const _GenresWrapList({
    super.key,
    required this.genres,
  });

  final List<MovieGenre> genres;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpaces.s8,
      children: genres
          .map(
            (genre) => Container(
              margin: const EdgeInsets.symmetric(vertical: AppSpaces.s4),
              decoration: BoxDecoration(
                color: context.colors.onBackground.withOpacity(0.15),
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.br16,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpaces.s10,
                  vertical: AppSpaces.s6,
                ),
                color: context.colors.background.withOpacity(0.65),
                child: Text(
                  genre.toTranslatedString(),
                  style: AppTextStyle.titleMedium.copyWith(
                    color: context.colors.onBackground,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class MovieCredits extends StatelessWidget {
  const MovieCredits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      buildWhen: (previous, current) =>
          previous.movie.credits != current.movie.credits,
      builder: (context, state) {
        final screenwriters = state.movie.credits.crew
            .where((member) => member.job == 'Screenplay')
            .toList();
        final directors = state.movie.credits.crew
            .where((member) => member.job == 'Director')
            .toList();
        final photographers = state.movie.credits.crew
            .where((member) => member.job == 'Director of Photography')
            .toList();
        final composers = state.movie.credits.crew
            .where((member) => member.job == 'Original Music Composer')
            .toList();
        final cast = state.movie.credits.cast;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppSpaces.s16),
              child: Text(
                'Reparto',
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onBackground,
                ),
              ),
            ),
            AppSpaces.gapH8,
            SizedBox(
              height: 130,
              child: ListView.separated(
                separatorBuilder: (context, index) => AppSpaces.gapW10,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
                itemCount: cast.length,
                itemBuilder: (context, index) {
                  final actor = cast[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: actor.profilePath != null
                            ? NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${actor.profilePath}',
                              )
                            : const AssetImage('') as ImageProvider,
                      ),
                      AppSpaces.gapH6,
                      Text(
                        actor.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.bodyMedium.copyWith(
                          color: context.colors.onBackground,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            AppSpaces.gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dirección',
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  if (directors.isNotEmpty)
                    Text(
                      directors.map((d) => d.name).join(', '),
                      style: AppTextStyle.titleMedium.copyWith(
                        color: context.colors.outline,
                      ),
                    ),
                  AppSpaces.gapH16,
                  Text(
                    'Guión',
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  if (screenwriters.isNotEmpty)
                    Text(
                      screenwriters.map((d) => d.name).join(', '),
                      style: AppTextStyle.titleMedium.copyWith(
                        color: context.colors.outline,
                      ),
                    ),
                  AppSpaces.gapH16,
                  Text(
                    'Música',
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  if (composers.isNotEmpty)
                    Text(
                      composers.map((d) => d.name).join(', '),
                      style: AppTextStyle.titleMedium.copyWith(
                        color: context.colors.outline,
                      ),
                    ),
                  AppSpaces.gapH16,
                  Text(
                    'Fotografía',
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  if (photographers.isNotEmpty)
                    Text(
                      photographers.map((d) => d.name).join(', '),
                      style: AppTextStyle.titleMedium.copyWith(
                        color: context.colors.outline,
                      ),
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
