import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/shimmer/shimmer_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_placeholder.dart';
import 'package:my_movie_hub/src/core/enums/list_display_modes.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: AppSpaces.s16),
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
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).padding.bottom),
          ),
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
                    color: context.colors.onBackground,
                  ),
                )
              : null,
          primary: false,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: AppTextStyle.titleMedium.copyWith(
            color: context.colors.primary,
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: context.colors.onBackground.withOpacity(0.125),
              ),
              onPressed:
                  context.read<ComplexMovieListCubit>().toggleListDisplayMode,
              icon: Icon(
                state.listDisplayMode == ListDisplayMode.listWithImages
                    ? Icons.calendar_view_day_outlined
                    : state.listDisplayMode == ListDisplayMode.grid2
                        ? Icons.grid_3x3_rounded
                        : state.listDisplayMode == ListDisplayMode.grid3
                            ? Icons.grid_4x4_rounded
                            : Icons.view_list_outlined,
                size: 28,
                color: context.colors.onBackground,
              ),
            ),
            AppSpaces.gapW6,
            for (final orderType in OrderType.values)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpaces.s10,
                  ),
                  disabledBackgroundColor:
                      context.colors.onBackground.withOpacity(0.125),
                  backgroundColor: context.colors.background,
                ),
                onPressed: state.orderType == orderType
                    ? () => context
                        .read<ComplexMovieListCubit>()
                        .updateOrderTypeAndReload(
                          state.orderType == OrderType.asc
                              ? OrderType.desc
                              : OrderType.asc,
                        )
                    : null,
                child: Text(
                  orderType == OrderType.asc ? 'Latest' : 'Oldest',
                  style: AppTextStyle.titleMedium.copyWith(
                    color: context.colors.onBackground,
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
            case ListDisplayMode.grid2:
              return _buildShimmerGrid(context, 2);
            case ListDisplayMode.grid3:
              return _buildShimmerGrid(context, 3);
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
          if (state.listDisplayMode == ListDisplayMode.grid2) {
            return _MovieGrid(
              state: state,
              crossAxisCount: 2,
            );
          }
          if (state.listDisplayMode == ListDisplayMode.grid3) {
            return _MovieGrid(
              state: state,
              crossAxisCount: 3,
            );
          }
          // if (state.listDisplayMode == ListDisplayMode.list)
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
    required this.crossAxisCount,
  });

  final ComplexMovieListState state;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 7.5,
        mainAxisSpacing: 15,
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
            return MovieCard(movie: state.movies[index]);
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

Widget _buildShimmerGrid(BuildContext context, int crossAxisCount) {
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: 0.7,
      crossAxisSpacing: 7.5,
      mainAxisSpacing: 15,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpaces.s10),
          child: ShimmerPlaceholder(
            width: double.infinity,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br8),
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
