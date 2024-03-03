import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_placeholder.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile.dart';
import 'package:my_movie_hub/src/features/movie_list/application/movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/application/movie_list_state.dart';
import 'package:my_movie_hub/src/features/watchlist/presentation/screens/refresco.dart';
import 'package:ui_kit/ui_kit.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _scrollController = ScrollController();
  final double _scrollThreshold = 200;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const _MovieListHeader(),
          Refresco(
            refreshTriggerPullDistance: 120,
            onRefresh: () async =>
                context.read<MovieListCubit>().loadMovies(isRefreshing: true),
          ),
          const _MovieListBody(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      await context.read<MovieListCubit>().loadMovies();
    }
  }
}

class _MovieListHeader extends StatelessWidget {
  const _MovieListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, MovieListState>(
      builder: (context, state) {
        return SliverAppBar(
          title: state.totalMovies != null
              ? Text(
                  '${state.totalMovies} Películas',
                  style: AppTextStyle.headlineMedium.copyWith(
                    color: AppColors.overlayLight,
                  ),
                )
              : null,
          primary: false,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: AppTextStyle.titleMedium.copyWith(
            color: AppColors.primary,
          ),
          actions: [
            TextButton(
              onPressed: state.orderType == OrderType.asc
                  ? () => context
                      .read<MovieListCubit>()
                      .updateOrderTypeAndReload(OrderType.desc)
                  : null,
              child: Text(
                'Latest',
                style: AppTextStyle.titleMedium.copyWith(
                  color: state.orderType == OrderType.asc
                      ? AppColors.overlayLight
                      : AppColors.black2,
                ),
              ),
            ),
            TextButton(
              onPressed: state.orderType == OrderType.desc
                  ? () => context
                      .read<MovieListCubit>()
                      .updateOrderTypeAndReload(OrderType.asc)
                  : null,
              child: Text(
                'Oldest',
                style: AppTextStyle.titleMedium.copyWith(
                  color: state.orderType == OrderType.desc
                      ? AppColors.overlayLight
                      : AppColors.black2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MovieListBody extends StatelessWidget {
  const _MovieListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListCubit, MovieListState>(
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
              onReload: context.read<MovieListCubit>().loadMovies,
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

class _MovieList extends StatelessWidget {
  const _MovieList({
    required this.state,
    super.key,
  });

  final MovieListState state;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => AppSpaces.gapH10,
      itemCount:
          state.hasReachedMax ? state.movies.length : state.movies.length + 1,
      itemBuilder: (context, index) {
        if (index >= state.movies.length) {
          if (state.status.isError) {
            return const Center(
              child: Text('Error cargando datos nuevos'),
            );
          } else {
            return const Center(
              child: MMHCircularProgressIndicator(),
            );
          }
        } else {
          return MovieListTile(movie: state.movies[index]);
        }
      },
    );
  }
}

class _MovieGrid extends StatelessWidget {
  const _MovieGrid({
    required this.state,
    super.key,
  });

  final MovieListState state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index >= state.movies.length) {
            if (state.status.isError) {
              return const Center(
                child: Text('Error cargando datos nuevos'),
              );
            } else {
              return const Center(
                child: MMHCircularProgressIndicator(),
              );
            }
          } else {
            return MovieListTile(movie: state.movies[index]);
          }
        },
        childCount:
            state.hasReachedMax ? state.movies.length : state.movies.length + 1,
      ),
    );
  }
}
