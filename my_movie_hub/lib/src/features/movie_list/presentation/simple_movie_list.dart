import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_placeholder.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_card.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_state.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class SimpleMovieList extends StatelessWidget {
  const SimpleMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimpleMovieListCubit(
        fetchMovies: locator<FavoritesRepository>().getFavoriteMovies,
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
          return const SliverToBoxAdapter(
            child: Center(
              child: MMHCircularProgressIndicator(),
            ),
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final listHeight = screenHeight * 0.3;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: listHeight,
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
                return const Center(
                  child: Text('Error cargando datos nuevos'),
                );
              } else {
                return const Center(
                  child: MMHCircularProgressIndicator(),
                );
              }
            } else {
              return MovieCard(movie: widget.state.movies[index]);
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
