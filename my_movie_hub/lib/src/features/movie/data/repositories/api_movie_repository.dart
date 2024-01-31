import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';

class ApiMovieRepository extends MovieRepository {
  ApiMovieRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<DetailedMovie, Exception>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final response = await networkService.get('/movie/$movieId');

      final result =
          DetailedMovie.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<Unit, Exception>> getMovieAccountStates({
    required int movieId,
  }) async {
    try {
      await networkService.get(
        'movie/${Endpoints.accountStates}',
        queryParameters: {
          'movie_id': movieId,
        },
      );

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
      await networkService.post(
        Endpoints.addRemoveMovieFromWatchlist,
        data: {
          'media_type': 'movie',
          'media_id': movieId,
          'watchlist': true,
        },
      );

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
      await networkService.post(
        Endpoints.addRemoveMovieFromWatchlist,
        data: {
          'media_type': 'movie',
          'media_id': movieId,
          'watchlist': false,
        },
      );

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
