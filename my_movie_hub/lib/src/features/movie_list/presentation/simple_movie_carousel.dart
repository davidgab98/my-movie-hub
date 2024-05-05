import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/shimmer/shimmer_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_reload_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_loading_new_data_message_placeholder.dart';
import 'package:my_movie_hub/src/core/utils/hot_restart_controller.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile_image.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_state.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:ui_kit/ui_kit.dart';

class SimpleMovieCarousel extends StatelessWidget {
  const SimpleMovieCarousel({required this.fetchMovies, super.key});

  final Future<Result<MovieListResponse, Exception>> Function({
    required int page,
  }) fetchMovies;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimpleMovieListCubit(
        fetchMovies: fetchMovies,
      )..loadMovies(),
      child: const CustomScrollView(
        scrollDirection: Axis.horizontal,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [_MovieListBody()],
      ),
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
          return const ShimmerCarousel();
        } else if (state.status.isError && state.movies.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ErrorDataReloadPlaceholder(
                onReload: () => HotRestartController.performHotRestart(context),
              ),
            ),
          );
        } else if (state.movies.isNotEmpty) {
          return _MovieList(
            state: state,
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox.shrink(),
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
        child: Swiper(
          autoplay: true,
          autoplayDelay: 4000,
          itemBuilder: (context, index) {
            if (index >= widget.state.movies.length) {
              if (widget.state.status.isError) {
                return const ErrorLoadingNewDataMessagePlaceholder();
              } else {
                return const Center(
                  child: MMHCircularProgressIndicator(),
                );
              }
            } else {
              return MovieListTileImage(movie: widget.state.movies[index]);
            }
          },
          itemCount: 10,
          viewportFraction: 0.8,
          scale: 0.9,
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

class ShimmerCarousel extends StatelessWidget {
  const ShimmerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: SizedBox(
        width: screenWidth,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ShimmerPlaceholder(
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.br16),
              ),
            );
          },
          itemCount: 10,
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      ),
    );
  }
}
