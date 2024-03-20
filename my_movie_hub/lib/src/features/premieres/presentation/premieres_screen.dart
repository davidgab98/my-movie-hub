import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_card.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/widgets/refresco.dart';
import 'package:my_movie_hub/src/features/premieres/application/premieres_cubit.dart';
import 'package:my_movie_hub/src/features/premieres/application/premieres_state.dart';
import 'package:my_movie_hub/src/features/premieres/domain/repositories/premieres_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class PremieresScreen extends StatelessWidget {
  const PremieresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Premieres',
        leadingIconAction: () => context.pushNamed(AppRoute.profile.name),
      ),
      body: BlocProvider<PremieresCubit>(
        create: (context) => PremieresCubit(
          premieresRepository: locator<PremieresRepository>(),
        )..getPremieres(),
        child: const SafeArea(
          bottom: false,
          child: _Body(),
        ),
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
    return BlocBuilder<PremieresCubit, PremieresState>(
      builder: (context, state) {
        return TimeLine(
          movies: state.movies,
        );
      },
    );
  }
}

class TimeLine extends StatefulWidget {
  final List<Movie> movies;
  const TimeLine({required this.movies, super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final _scrollController = ScrollController();
  final double _scrollThreshold = 200;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      context.read<PremieresCubit>().getPremieres();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Agrupar películas por fecha de estreno
    final moviesByDate = _groupMoviesByDate(widget.movies);

    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const _TimeLineFiltersHeader(),
        Refresco(
          refreshTriggerPullDistance: 120,
          onRefresh: () async =>
              context.read<PremieresCubit>().getPremieres(isRefreshing: true),
        ),
        SliverList.builder(
          itemCount: moviesByDate.keys.length,
          itemBuilder: (context, index) {
            final date = moviesByDate.keys.elementAt(index);
            final dateMovies = moviesByDate[date]!;
            return _TimeLineItem(date: date, movies: dateMovies);
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).padding.bottom),
        ),
      ],
    );
  }

  // Agrupar las películas por su fecha de lanzamiento
  Map<String, List<Movie>> _groupMoviesByDate(List<Movie> movies) {
    final Map<String, List<Movie>> map = {};
    for (final movie in movies) {
      if (!map.containsKey(movie.releaseDate)) {
        map[movie.releaseDate] = [];
      }
      map[movie.releaseDate]!.add(movie);
    }
    return map;
  }
}

class _TimeLineFiltersHeader extends StatelessWidget {
  const _TimeLineFiltersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 72,
      backgroundColor: context.colors.background,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpaces.s12,
          horizontal: AppSpaces.s16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 7,
              child: MMHSearchField(
                onChanged: (query) {},
              ),
            ),
            AppSpaces.gapW8,
            Expanded(
              flex: 3,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeLineItem extends StatelessWidget {
  const _TimeLineItem({
    required this.date,
    required this.movies,
    super.key,
  });

  final String date;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final dateParts = date.split('-');
    final dateFormated = '${dateParts[0]}\n${dateParts[1]}\n${dateParts[2]}';

    return IntrinsicHeight(
      // Permite que el widget hijo defina la altura
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: AppSpaces.s8),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpaces.s6,
                  vertical: AppSpaces.s4,
                ),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(AppBorderRadius.br8),
                ),
                child: Text(
                  dateFormated,
                  style: AppTextStyle.bodyLarge
                      .copyWith(color: context.colors.onPrimary),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          AppSpaces.gapW2,
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 6,
                margin: const EdgeInsets.symmetric(vertical: AppSpaces.s4),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(AppBorderRadius.brMax),
                ),
              ),
              Icon(
                Icons.linear_scale,
                color: context.colors.primary,
                size: 20,
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.26,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.s8,
                    horizontal: AppSpaces.s6,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1 / 1.5,
                    child: MovieCard(movie: movies[index]),
                  ),
                ),
                itemCount: movies.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
