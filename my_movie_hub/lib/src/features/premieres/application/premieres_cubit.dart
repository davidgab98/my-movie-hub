import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/premieres/application/premieres_state.dart';
import 'package:my_movie_hub/src/features/premieres/domain/repositories/premieres_repository.dart';

class PremieresCubit extends Cubit<PremieresState> with ExceptionsHelper {
  PremieresCubit({
    required PremieresRepository premieresRepository,
  })  : _premieresRepository = premieresRepository,
        super(const PremieresState());

  final PremieresRepository _premieresRepository;
  int _currentPage = 1;

  Future<void> getPremieres({bool isRefreshing = false}) async {
    if (isRefreshing) {
      _currentPage = 1;
      emit(state.copyWith(status: StateStatus.initial));
    }

    if ((state.status.isLoaded && state.hasReachedMax) ||
        state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _premieresRepository.getPremieres(
      page: _currentPage,
      initialDate: DateTime.now(),
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
}
