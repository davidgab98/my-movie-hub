import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/shimmer/shimmer_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_placeholder.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_card.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_state.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:ui_kit/ui_kit.dart';

class SimpleMovieList extends StatelessWidget {
  const SimpleMovieList({
    this.fetchMovies,
    this.fetchMoviesByMovieId,
    this.movieId,
    super.key,
  }) : assert(
          fetchMovies != null && fetchMoviesByMovieId == null ||
              fetchMovies == null &&
                  fetchMoviesByMovieId != null &&
                  movieId != null,
          'You must provide a fetchMovies or a fetchMoviesByIdMovie but not both. If provide fetchMoviesByMovieId, you must provide a movieId',
        );

  final Future<Result<MovieListResponse, Exception>> Function({
    required int page,
  })? fetchMovies;

  final Future<Result<MovieListResponse, Exception>> Function({
    required int page,
    required int movieId,
  })? fetchMoviesByMovieId;

  final int? movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimpleMovieListCubit(
        fetchMovies: fetchMovies,
        fetchMoviesByMovieId: fetchMoviesByMovieId,
        movieId: movieId,
      )..loadMovies(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [_MovieListBody()],
    );
  }
}

class _MovieListBody extends StatelessWidget {
  const _MovieListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimpleMovieListCubit, SimpleMovieListState>(
      builder: (context, state) {
        if (state.status.isInitial ||
            (state.status.isLoading && state.movies.isEmpty)) {
          return SliverToBoxAdapter(
            child: buildShimmerHorizontalList(context),
          );
        } else if (state.status.isError && state.movies.isEmpty) {
          return SliverToBoxAdapter(
            child: ErrorDataReloadPlaceholder(
              onReload: context.read<SimpleMovieListCubit>().loadMovies,
            ),
          );
        } else if (state.movies.isNotEmpty) {
          return _MovieList(
            state: state,
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No tienes películas en tu watchlist'),
            ),
          );
        }
      },
    );
  }
}

class _MovieList extends StatefulWidget {
  const _MovieList({
    required this.state,
    super.key,
  });

  final SimpleMovieListState state;

  @override
  State<_MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<_MovieList> {
  final _scrollController = ScrollController();
  final double _scrollThreshold = 200;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: SizedBox(
        width: screenWidth,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => AppSpaces.gapW12,
          padding: const EdgeInsets.only(left: AppSpaces.s12),
          itemCount: widget.state.hasReachedMax
              ? widget.state.movies.length
              : widget.state.movies.length + 1,
          itemBuilder: (context, index) {
            if (index >= widget.state.movies.length) {
              if (widget.state.status.isError) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpaces.s16,
                    0,
                    AppSpaces.s32,
                    0,
                  ),
                  child: Center(
                    child: Text(
                      'Error',
                      style: AppTextStyle.titleMedium
                          .copyWith(color: context.colors.onBackground),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(AppSpaces.s16, 0, AppSpaces.s32, 0),
                    child: MMHCircularProgressIndicator(),
                  ),
                );
              }
            } else {
              return AspectRatio(
                aspectRatio: 1 / 1.5,
                child: MovieCard(movie: widget.state.movies[index]),
              );
            }
          },
        ),
      ),
    );
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
      context.read<SimpleMovieListCubit>().loadMovies();
    }
  }
}

Widget buildShimmerHorizontalList(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return SizedBox(
    width: screenWidth,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => AppSpaces.gapW12,
      padding: const EdgeInsets.only(left: AppSpaces.s12),
      itemCount: 6,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1 / 1.5,
          child: ShimmerPlaceholder(
            width: screenWidth,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br16),
            ),
          ),
        );
      },
    ),
  );
}
