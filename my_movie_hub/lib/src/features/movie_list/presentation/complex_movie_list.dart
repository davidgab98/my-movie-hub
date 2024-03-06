import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/shimmer/shimmer_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_placeholder.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_card.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile_image.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_cubit.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_state.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/widgets/refresco.dart';
import 'package:ui_kit/ui_kit.dart';

class ComplexMovieList extends StatefulWidget {
  const ComplexMovieList({super.key});

  @override
  State<ComplexMovieList> createState() => _ComplexMovieListState();
}

class _ComplexMovieListState extends State<ComplexMovieList> {
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
      padding: const EdgeInsets.fromLTRB(
        AppSpaces.s16,
        0,
        AppSpaces.s16,
        0,
      ),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const _MovieListHeader(),
          Refresco(
            refreshTriggerPullDistance: 120,
            onRefresh: () async => context
                .read<ComplexMovieListCubit>()
                .loadMovies(isRefreshing: true),
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
      await context.read<ComplexMovieListCubit>().loadMovies();
    }
  }
}

class _MovieListHeader extends StatelessWidget {
  const _MovieListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComplexMovieListCubit, ComplexMovieListState>(
      builder: (context, state) {
        return SliverAppBar(
          title: state.totalMovies != null
              ? Text(
                  '${state.totalMovies} Movies',
                  style: AppTextStyle.titleMedium.copyWith(
                    color: AppColors.overlayDark,
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
            IconButton(
              onPressed:
                  context.read<ComplexMovieListCubit>().toggleListDisplayMode,
              icon: Icon(
                state.listDisplayMode == ListDisplayMode.listWithImages
                    ? Icons.grid_view_rounded
                    : state.listDisplayMode == ListDisplayMode.grid
                        ? Icons.view_list_rounded
                        : Icons.featured_play_list_rounded,
                size: 28,
                color: AppColors.overlayDark,
              ),
            ),
            TextButton(
              onPressed: state.orderType == OrderType.asc
                  ? () => context
                      .read<ComplexMovieListCubit>()
                      .updateOrderTypeAndReload(OrderType.desc)
                  : null,
              child: Text(
                'Latest',
                style: AppTextStyle.titleMedium.copyWith(
                  color: state.orderType == OrderType.asc
                      ? AppColors.overlayDark
                      : AppColors.black2,
                ),
              ),
            ),
            TextButton(
              onPressed: state.orderType == OrderType.desc
                  ? () => context
                      .read<ComplexMovieListCubit>()
                      .updateOrderTypeAndReload(OrderType.asc)
                  : null,
              child: Text(
                'Oldest',
                style: AppTextStyle.titleMedium.copyWith(
                  color: state.orderType == OrderType.desc
                      ? AppColors.overlayDark
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
    return BlocBuilder<ComplexMovieListCubit, ComplexMovieListState>(
      builder: (context, state) {
        if (state.status.isInitial ||
            (state.status.isLoading && state.movies.isEmpty)) {
          switch (state.listDisplayMode) {
            case ListDisplayMode.listWithImages:
              return _buildShimmerListWithImages(context);
            case ListDisplayMode.grid:
              return _buildShimmerGrid(context);
            case ListDisplayMode.list:
              return _buildShimmerList(context);
          }
        } else if (state.status.isError && state.movies.isEmpty) {
          return SliverToBoxAdapter(
            child: ErrorDataReloadPlaceholder(
              onReload: context.read<ComplexMovieListCubit>().loadMovies,
            ),
          );
        } else if (state.movies.isNotEmpty) {
          if (state.listDisplayMode == ListDisplayMode.listWithImages) {
            return _MovieListWithImages(
              state: state,
            );
          }
          if (state.listDisplayMode == ListDisplayMode.grid) {
            return _MovieGrid(
              state: state,
            );
          }
          // state.listDisplayMode == ListDisplayMode.list
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

class _MovieListWithImages extends StatelessWidget {
  const _MovieListWithImages({
    required this.state,
    super.key,
  });

  final ComplexMovieListState state;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => AppSpaces.gapH20,
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
          return MovieListTileImage(movie: state.movies[index]);
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

  final ComplexMovieListState state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
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
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpaces.s10),
              child: MovieCard(movie: state.movies[index]),
            );
          }
        },
        childCount:
            state.hasReachedMax ? state.movies.length : state.movies.length + 1,
      ),
    );
  }
}

class _MovieList extends StatelessWidget {
  const _MovieList({
    required this.state,
    super.key,
  });

  final ComplexMovieListState state;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Colors.blueGrey,
        height: 5,
        thickness: 0.15,
      ),
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

Widget _buildShimmerListWithImages(BuildContext context) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpaces.s20),
        child: AspectRatio(
          aspectRatio: 16 / 7,
          child: ShimmerPlaceholder(
            width: double.infinity,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br16),
            ),
          ),
        ),
      ),
      childCount: 10,
    ),
  );
}

Widget _buildShimmerGrid(BuildContext context) {
  return SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpaces.s10),
          child: ShimmerPlaceholder(
            width: double.infinity,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br16),
            ),
          ),
        );
      },
      childCount: 6,
    ),
  );
}

Widget _buildShimmerList(BuildContext context) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpaces.s12),
        child: AspectRatio(
          aspectRatio: 6 / 1,
          child: ShimmerPlaceholder(
            width: double.infinity,
            height: 60,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br10),
            ),
          ),
        ),
      ),
      childCount: 10,
    ),
  );
}
