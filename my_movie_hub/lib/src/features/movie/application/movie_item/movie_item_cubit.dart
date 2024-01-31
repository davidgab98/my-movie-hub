import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_item/movie_item_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MovieItemCubit extends Cubit<MovieItemState> with ExceptionsHelper {
  MovieItemCubit({
    required int movieId,
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        _movieId = movieId,
        super(const MovieItemState());

  final MovieRepository _movieRepository;
  final int _movieId;

  Future<void> getMovieAccountStates() async {
    if (state.accountStatesStatus.isLoading) return;

    emit(state.copyWith(accountStatesStatus: StateStatus.loading));

    final result = await _movieRepository.getMovieAccountStates(
      movieId: _movieId,
    );

    result.when(
      (success) {
        emit(
          state.copyWith(
            accountStatesStatus: StateStatus.loaded,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          errorMessage: getExceptionMessage(error),
          accountStatesStatus: StateStatus.error,
        ),
      ),
    );
  }
}
