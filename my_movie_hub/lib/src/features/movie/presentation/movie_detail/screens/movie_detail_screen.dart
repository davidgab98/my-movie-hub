import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/reload_button_placeholder.dart';
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
    required this.movie,
    super.key,
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
          return GestureDetector(
            onTap: () => _showFullImage(context),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (movie.posterPath.isNotEmpty)
                  Image.network(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                    fit: BoxFit.cover,
                  )
                else
                  Container(
                    padding: const EdgeInsets.all(AppSpaces.s16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withValues(alpha: 0.3),
                          AppColors.secondary.withValues(alpha: 0.2),
                          AppColors.tertiary.withValues(alpha: 0.1),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        context.colors.surface,
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
                          color: context.colors.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showFullImage(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(AppSpaces.s16),
            child: Image.network(
              'https://image.tmdb.org/t/p/original/${movie.posterPath}',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}

class _DetailsBody extends StatelessWidget {
  const _DetailsBody({
    required this.movie,
    super.key,
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
                  '${movie.releaseDate.isNotEmpty ? '${DateTime.parse(movie.releaseDate).year} | ' : ''} ${movie.genres.isNotEmpty ? '${movie.genres.map((genre) => genre.toTranslatedString()).join(', ')} | ' : ''}${state.movie.runtime?.formatDuration() ?? '0h 0m'}',
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
              if (!state.status.isError)
                const MovieAccountStatesRow()
              else
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSpaces.s4),
                      decoration: BoxDecoration(
                        color: context.colors.surface.withValues(alpha: 0.75),
                      ),
                      child: const MovieAccountStatesRow(),
                    ),
                    ReloadButtonPlaceholder(
                      onReload: () =>
                          context.read<MovieDetailCubit>().getMovieDetails(),
                    ),
                  ],
                ),
              AppSpaces.gapH24,
              Divider(
                indent: AppSpaces.s16,
                endIndent: AppSpaces.s16,
                height: 0,
                color: context.colors.onSurface.withValues(alpha: 1),
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
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
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
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              Text(
                movie.overview,
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.onSurface,
                ),
                textAlign: TextAlign.justify,
              ),
              AppSpaces.gapH20,
              _GenresWrapList(genres: movie.genres),
              AppSpaces.gapH20,
              Text(
                'movieDetails.originalTitleLabel'.tr(),
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onSurface,
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
                'movieDetails.yearLabel'.tr(),
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
              Text(
                movie.releaseDate.isNotEmpty
                    ? '${DateTime.parse(movie.releaseDate).year}'
                    : '',
                style: AppTextStyle.titleMedium.copyWith(
                  color: context.colors.outline,
                ),
              ),
              AppSpaces.gapH16,
              Text(
                'movieDetails.durationLabel'.tr(),
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onSurface,
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
                'movieDetails.countryLabel'.tr(),
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onSurface,
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
                'movieDetails.productionCompaniesLabel'.tr(),
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onSurface,
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
    required this.genres,
    super.key,
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
                color: context.colors.onSurface.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.br16,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpaces.s10,
                  vertical: AppSpaces.s6,
                ),
                color: context.colors.surface.withValues(alpha: 0.65),
                child: Text(
                  genre.toTranslatedString(),
                  style: AppTextStyle.titleMedium.copyWith(
                    color: context.colors.onSurface,
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
                'movieDetails.castLabel'.tr(),
                style: AppTextStyle.titleLarge.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
            AppSpaces.gapH8,
            SizedBox(
              height: 150,
              child: ListView.separated(
                separatorBuilder: (context, index) => AppSpaces.gapW10,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
                itemCount: cast.length,
                itemBuilder: (context, index) {
                  final actor = cast[index];
                  return AspectRatio(
                    aspectRatio: 1 / 1.25,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: actor.profilePath != null
                              ? NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/${actor.profilePath}',
                                )
                              : null,
                          child: actor.profilePath == null
                              ? Container(
                                  padding: const EdgeInsets.all(AppSpaces.s16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppBorderRadius.brMax,
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.primary
                                            .withValues(alpha: 0.3),
                                        AppColors.secondary
                                            .withValues(alpha: 0.2),
                                        AppColors.tertiary
                                            .withValues(alpha: 0.1),
                                      ],
                                      stops: const [0.0, 0.5, 1.0],
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        AppSpaces.gapH6,
                        Text(
                          actor.name,
                          style: AppTextStyle.bodyMedium.copyWith(
                            color: context.colors.onSurface,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AppSpaces.gapH12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'movieDetails.directionLabel'.tr(),
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onSurface,
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
                    'movieDetails.screenplayLabel'.tr(),
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onSurface,
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
                    'movieDetails.musicLabel'.tr(),
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onSurface,
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
                    'movieDetails.photographyLabel'.tr(),
                    style: AppTextStyle.titleLarge.copyWith(
                      color: context.colors.onSurface,
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
            ),
          ],
        );
      },
    );
  }
}
