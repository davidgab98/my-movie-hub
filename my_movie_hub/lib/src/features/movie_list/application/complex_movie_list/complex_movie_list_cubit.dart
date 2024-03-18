import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie_list/application/complex_movie_list/complex_movie_list_state.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

abstract class ComplexMovieListCubit extends Cubit<ComplexMovieListState>
    with ExceptionsHelper {
  ComplexMovieListCubit({
    required Future<Result<MovieListResponse, Exception>> Function(
            {required int page, OrderType orderType})
        fetchMovies,
  })  : _fetchMovies = fetchMovies,
        super(const ComplexMovieListState());

  final Future<Result<MovieListResponse, Exception>> Function(
      {required int page, OrderType orderType}) _fetchMovies;
  int _currentPage = 1;

  Future<void> loadMovies({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _currentPage = 1;
      emit(state.copyWith(status: StateStatus.initial));
    }

    if ((state.status.isLoaded && state.hasReachedMax) ||
        state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _fetchMovies(
      page: _currentPage,
      orderType: state.orderType,
    );

    result.when(
      (success) {
        _currentPage = _currentPage + 1;

        emit(
          state.copyWith(
            movies:
                isRefreshing ? success.movies : state.movies + success.movies,
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

  @protected
  void removeMovie({required int movieId}) {
    final newMovieList = state.movies.toList();
    newMovieList.removeWhere((e) => e.id == movieId);

    final newTotalMovies =
        state.totalMovies != null && newMovieList.length < state.movies.length
            ? state.totalMovies! - 1
            : state.totalMovies;

    emit(state.copyWith(movies: newMovieList, totalMovies: newTotalMovies));
  }

  @protected
  void addMovie({required Movie movie}) {
    if (!state.movies.contains(movie)) {
      final insertionIndex =
          state.orderType == OrderType.desc ? 0 : state.movies.length;
      final newMovieList = List<Movie>.from(state.movies)
        ..insert(insertionIndex, movie);

      final newTotalMovies = state.totalMovies != null
          ? state.totalMovies! + 1
          : state.totalMovies;

      emit(state.copyWith(movies: newMovieList, totalMovies: newTotalMovies));
    }
  }

  Future<void> updateOrderTypeAndReload(OrderType orderType) async {
    emit(state.copyWith(orderType: orderType));
    await loadMovies(isRefreshing: true);
  }

  void toggleListDisplayMode() {
    final ListDisplayMode newListDisplayMode =
        state.listDisplayMode.index + 1 >= ListDisplayMode.values.length
            ? ListDisplayMode.values[0]
            : ListDisplayMode.values[state.listDisplayMode.index + 1];

    emit(state.copyWith(listDisplayMode: newListDisplayMode));
  }
}
