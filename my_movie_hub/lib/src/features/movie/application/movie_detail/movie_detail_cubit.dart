import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/core/utils/safe_cubit.dart';
import 'package:my_movie_hub/src/features/movie/application/movie_detail/movie_detail_state.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MovieDetailCubit extends SafeCubit<MovieDetailState>
    with ExceptionsHelper {
  MovieDetailCubit({
    required Movie movie,
    required MovieRepository movieRepository,
  })  : _movieRepository = movieRepository,
        super(const MovieDetailState()) {
    emit(state.copyWith(movie: DetailedMovie.fromMovie(movie)));
  }

  final MovieRepository _movieRepository;

  Future<void> getMovieDetails() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    await Future<void>.delayed(const Duration(seconds: 2));
    final result = await _movieRepository.getMovieDetails(
      movieId: state.movie.id,
    );

    result.when(
      (success) {
        emit(
          state.copyWith(
            movie: success,
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
