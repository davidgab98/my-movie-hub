import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

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
  Future<Result<AccountStates, Exception>> getMovieAccountStates({
    required int movieId,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      const accountStates = AccountStates();

      return const Success(accountStates);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> toggleMovieWatchlistStatus({
    required int movieId,
    required bool addToWatchlist,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<MovieListResponse, Exception>> getRecommendations({
    required int movieId,
    required int page,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(MovieListResponse());
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> toggleMovieFavoriteStatus({
    required int movieId,
    required bool addToFavorites,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> addMovieRating({
    required int movieId,
    required double rating,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> removeMovieRating({
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
