import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/watchlist/application/watchlist_state.dart';
import 'package:my_movie_hub/src/features/watchlist/domain/repositories/watchlist_repository.dart';

class WatchlistCubit extends Cubit<WatchlistState> with ExceptionsHelper {
  WatchlistCubit({required WatchlistRepository watchlistRepository})
      : _watchlistRepository = watchlistRepository,
        super(const WatchlistState());

  final WatchlistRepository _watchlistRepository;
  int _currentPage = 1;

  Future<void> getWatchlistMovies({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _currentPage = 1;
      emit(state.copyWith(status: StateStatus.initial, movies: []));
    }

    if ((state.status.isLoaded && state.hasReachedMax) ||
        state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _watchlistRepository.getWatchlist(
      page: _currentPage,
      orderType: state.orderType,
    );

    result.when(
      (success) {
        _currentPage = _currentPage + 1;
        emit(
          state.copyWith(
            movies: state.movies + success.movies,
            totalMovies: success.totalResults,
            hasReachedMax: _currentPage > success.totalPages,
            status: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          status: StateStatus.error,
        ),
      ),
    );
  }

  Future<void> updateOrderTypeAndReload(OrderType orderType) async {
    emit(state.copyWith(orderType: orderType));

    await getWatchlistMovies(isRefreshing: true);
  }
}
