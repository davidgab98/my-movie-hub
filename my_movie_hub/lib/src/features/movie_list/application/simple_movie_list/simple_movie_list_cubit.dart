import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/movie_list/application/simple_movie_list/simple_movie_list_state.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

class SimpleMovieListCubit extends Cubit<SimpleMovieListState>
    with ExceptionsHelper {
  SimpleMovieListCubit({
    required Future<Result<MovieListResponse, Exception>> Function({
      required int page,
    }) fetchMovies,
  })  : _fetchMovies = fetchMovies,
        super(const SimpleMovieListState());

  final Future<Result<MovieListResponse, Exception>> Function({
    required int page,
  }) _fetchMovies;
  int _currentPage = 1;

  Future<void> loadMovies({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _currentPage = 1;
      emit(state.copyWith(status: StateStatus.initial));
    }

    if ((state.status.isLoaded && state.hasReachedMax) ||
        state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _fetchMovies(page: _currentPage);

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
}
