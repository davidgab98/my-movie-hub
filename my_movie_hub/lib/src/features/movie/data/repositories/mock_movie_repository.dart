import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class MockMovieRepository extends MovieRepository {
  MockMovieRepository();

  @override
  Future<Result<DetailedMovie, Exception>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(DetailedMovie(id: 1));
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> getMovieAccountStates({
    required int movieId,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> addMovieToWatchlist({
    required int movieId,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> removeMovieFromWatchlist({
    required int movieId,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
