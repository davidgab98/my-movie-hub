import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/enums/list_display_modes.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/search/application/search_state.dart';
import 'package:my_movie_hub/src/features/search/domain/repositories/search_repository.dart';

class SearchCubit extends Cubit<SearchState> with ExceptionsHelper {
  SearchCubit({
    required SearchRepository searchRepository,
  })  : _searchRepository = searchRepository,
        super(const SearchState());

  final SearchRepository _searchRepository;
  int _currentPage = 1;

  Future<void> searchMovies({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _currentPage = 1;
      emit(state.copyWith(status: StateStatus.initial));
    }

    if ((state.status.isLoaded && state.hasReachedMax) ||
        state.status.isLoading) {
      return;
    }

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _searchRepository.searchMovie(
      page: _currentPage,
      year: state.year,
      query: state.query,
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

  void updateQueryAndSearch(String query) {
    emit(state.copyWith(query: query));

    searchMovies(isRefreshing: true);
  }

  void updateYearAndSearch({String? year}) {
    emit(state.copyWith(year: year ?? ''));

    searchMovies(isRefreshing: true);
  }

  void toggleListDisplayMode() {
    final ListDisplayMode newListDisplayMode =
        state.listDisplayMode.index + 1 >= ListDisplayMode.values.length
            ? ListDisplayMode.values[0]
            : ListDisplayMode.values[state.listDisplayMode.index + 1];

    emit(state.copyWith(listDisplayMode: newListDisplayMode));
  }
}
