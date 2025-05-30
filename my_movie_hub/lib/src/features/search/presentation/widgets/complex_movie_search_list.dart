import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/shimmer/shimmer_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_reload_placeholder.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_loading_new_data_message_placeholder.dart';
import 'package:my_movie_hub/src/core/enums/list_display_modes.dart';
import 'package:my_movie_hub/src/core/utils/debouncer.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_card.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile_image.dart';
import 'package:my_movie_hub/src/features/movie_list/presentation/widgets/refresco.dart';
import 'package:my_movie_hub/src/features/search/application/search_cubit.dart';
import 'package:my_movie_hub/src/features/search/application/search_state.dart';
import 'package:ui_kit/ui_kit.dart';

class ComplexMovieSearchList extends StatefulWidget {
  const ComplexMovieSearchList({super.key});

  @override
  State<ComplexMovieSearchList> createState() => _ComplexMovieSearchListState();
}

class _ComplexMovieSearchListState extends State<ComplexMovieSearchList> {
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
        physics: const BouncingScrollPhysics(),
        slivers: [
          const _SearchInputHeader(),
          const _MovieListHeader(),
          Refresco(
            refreshTriggerPullDistance: 120,
            onRefresh: () async =>
                context.read<SearchCubit>().searchMovies(isRefreshing: true),
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
      await context.read<SearchCubit>().searchMovies();
    }
  }
}

class _SearchInputHeader extends StatelessWidget {
  const _SearchInputHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 300);

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverAppBar(
          floating: true,
          snap: true,
          toolbarHeight: 72,
          backgroundColor: context.colors.surface,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpaces.s12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 7,
                  child: MMHSearchField(
                    hintText: 'search.mainTitle'.tr(),
                    onChanged: (query) {
                      debouncer.run(
                        () => context
                            .read<SearchCubit>()
                            .updateQueryAndSearch(query),
                      );
                    },
                  ),
                ),
                AppSpaces.gapW8,
                const Expanded(
                  flex: 3,
                  child: _YearFilterDropDown(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _YearFilterDropDown extends StatelessWidget {
  const _YearFilterDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MMHDropdownButton<String>(
      values: generateYearsList(1888),
      currentValue: 'search.yearInputLabel'.tr(),
      onChange: (value) => context.read<SearchCubit>().updateYearAndSearch(
            year: value != 'search.yearInputLabel'.tr() ? value : '',
          ),
    );
  }

  List<String> generateYearsList(int firstYear) {
    final currentYear = DateTime.now().year;
    final years = ['search.yearInputLabel'.tr()];

    for (int year = currentYear; year >= firstYear; year--) {
      years.add(year.toString());
    }

    return years;
  }
}

class _MovieListHeader extends StatelessWidget {
  const _MovieListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverAppBar(
          elevation: 0,
          title: state.totalMovies != null
              ? Text(
                  '${state.totalMovies} ${'search.totalResultsLabel'.tr()}',
                  style: AppTextStyle.titleMedium.copyWith(
                    color: context.colors.onSurface,
                  ),
                )
              : null,
          primary: false,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: context.colors.surface,
          titleTextStyle: AppTextStyle.titleMedium.copyWith(
            color: context.colors.primary,
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor:
                    context.colors.onSurface.withValues(alpha: 0.125),
              ),
              onPressed: context.read<SearchCubit>().toggleListDisplayMode,
              icon: Icon(
                state.listDisplayMode == ListDisplayMode.listWithImages
                    ? Icons.calendar_view_day_outlined
                    : state.listDisplayMode == ListDisplayMode.grid2
                        ? Icons.grid_3x3_rounded
                        : state.listDisplayMode == ListDisplayMode.grid3
                            ? Icons.grid_4x4_rounded
                            : Icons.view_list_outlined,
                size: 28,
                color: context.colors.onSurface,
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
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.status.isInitial ||
            (state.status.isLoading && state.movies.isEmpty)) {
          if (state.year.isNotEmpty || state.query.isNotEmpty) {
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
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'search.textPlaceholder'.tr(),
                  style: AppTextStyle.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        } else if (state.status.isError && state.movies.isEmpty) {
          return SliverToBoxAdapter(
            child: ErrorDataReloadPlaceholder(
              onReload: context.read<SearchCubit>().searchMovies,
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
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.query.isEmpty && state.year.isEmpty
                    ? 'search.textPlaceholder'.tr()
                    : 'search.emptyResultsText'.tr(),
                style: AppTextStyle.titleMedium,
                textAlign: TextAlign.center,
              ),
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

  final SearchState state;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => AppSpaces.gapH20,
      itemCount:
          state.hasReachedMax ? state.movies.length : state.movies.length + 1,
      itemBuilder: (context, index) {
        if (index >= state.movies.length) {
          if (state.status.isError) {
            return const ErrorLoadingNewDataMessagePlaceholder();
          } else {
            return Center(child: _buildSingleListTileWithImageShimmer(context));
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
    required this.crossAxisCount,
    super.key,
  });

  final SearchState state;
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
              return const ErrorLoadingNewDataMessagePlaceholder();
            } else {
              return Center(child: _buildSingleGridCardShimmer(context));
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

  final SearchState state;

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
            return const ErrorLoadingNewDataMessagePlaceholder();
          } else {
            return Center(child: _buildSingleListTileShimmer(context));
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

Widget _buildSingleListTileWithImageShimmer(BuildContext context) {
  return AspectRatio(
    aspectRatio: 16 / 7,
    child: ShimmerPlaceholder(
      width: double.infinity,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br16),
      ),
    ),
  );
}

Widget _buildSingleGridCardShimmer(BuildContext context) {
  return ShimmerPlaceholder(
    width: double.infinity,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.br8),
    ),
  );
}

Widget _buildSingleListTileShimmer(BuildContext context) {
  return AspectRatio(
    aspectRatio: 6 / 1,
    child: ShimmerPlaceholder(
      width: double.infinity,
      height: 60,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.br10),
      ),
    ),
  );
}
