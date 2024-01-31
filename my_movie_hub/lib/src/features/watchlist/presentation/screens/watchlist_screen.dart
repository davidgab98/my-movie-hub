import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/mmh_refresh_indicator.dart';
import 'package:my_movie_hub/src/core-ui/placeholders/error_data_placeholder.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/movie/presentation/movie_item/widgets/movie_list_tile.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_cubit.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_state.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';
import 'package:ui_kit/ui_kit.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: BlocProvider(
        create: (_) => WatchlistCubit(
          watchlistRepository: locator<WatchlistRepository>(),
        )..getWatchlistMovies(),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpaces.s16),
            child: _Body(),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({super.key});

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _scrollController = ScrollController();
  final double _scrollThreshold = 200;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MMHRefreshIndicator(
      onRefresh: () async =>
          context.read<WatchlistCubit>().getWatchlistMovies(isRefreshing: true),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: const <Widget>[
          _WatchlistHeader(),
          _WatchlistBody(),
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
      await context.read<WatchlistCubit>().getWatchlistMovies();
    }
  }
}

class _WatchlistHeader extends StatelessWidget {
  const _WatchlistHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, state) {
        return SliverAppBar(
          title: state.totalMovies != null
              ? Text('${state.totalMovies} Películas guardadas')
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
              onPressed: state.orderType == OrderType.desc
                  ? () => context
                      .read<WatchlistCubit>()
                      .updateOrderTypeAndReload(OrderType.asc)
                  : null,
              child: const Text('Latest'),
            ),
            TextButton(
              onPressed: state.orderType == OrderType.asc
                  ? () => context
                      .read<WatchlistCubit>()
                      .updateOrderTypeAndReload(OrderType.desc)
                  : null,
              child: const Text('Oldest'),
            ),
          ],
        );
      },
    );
  }
}

class _WatchlistBody extends StatelessWidget {
  const _WatchlistBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
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
              onReload: context.read<WatchlistCubit>().getWatchlistMovies,
            ),
          );
        } else if (state.movies.isNotEmpty) {
          return _Watchlist(
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

class _Watchlist extends StatelessWidget {
  const _Watchlist({
    required this.state,
    super.key,
  });

  final WatchlistState state;

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

class _Watchgrid extends StatelessWidget {
  const _Watchgrid({
    required this.state,
    super.key,
  });

  final WatchlistState state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.0,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.85,
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
            return Container(
              color: Colors.red,
              width: 20,
              height: 60,
            );
          }
        },
        childCount:
            state.hasReachedMax ? state.movies.length : state.movies.length + 1,
      ),
    );
  }
}
