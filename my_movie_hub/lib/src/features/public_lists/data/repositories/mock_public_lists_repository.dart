import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/public_lists/domain/repositories/public_lists_repository.dart';

class MockPublicListsRepository extends PublicListsRepository {
  MockPublicListsRepository();

  @override
  Future<Result<MovieListResponse, Exception>> getPopularMovies({
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
  Future<Result<MovieListResponse, Exception>> getNowPlayingMovies({
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
  Future<Result<MovieListResponse, Exception>> getTopRatedMovies({
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
  Future<Result<MovieListResponse, Exception>> getUpcomingMovies({
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
  Future<Result<MovieListResponse, Exception>> getTrendingMovies({
    required int page,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(MovieListResponse());
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
