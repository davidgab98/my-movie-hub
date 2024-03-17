import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';
import 'package:my_movie_hub/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

class ApiMovieRepository extends MovieRepository {
  ApiMovieRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<DetailedMovie, Exception>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final response = await networkService.get(
        '/movie/$movieId',
        queryParameters: {
          'append_to_response': 'account_states,credits',
        },
      );

      final result =
          DetailedMovie.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<AccountStates, Exception>> getMovieAccountStates({
    required int movieId,
  }) async {
    try {
      final response = await networkService.get(
        '/movie/$movieId${Endpoints.accountStates}',
      );

      await Future<void>.delayed(const Duration(seconds: 2));

      final result =
          AccountStates.fromJson(response.data as Map<String, Object?>);

      return Success(result);
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
      final response = await networkService.get(
        '/movie/$movieId/${Endpoints.recommendations}',
        queryParameters: {
          'page': page,
        },
      );

      final MovieListResponse result =
          MovieListResponse.fromJson(response.data as Map<String, Object?>);

      return Success(result);
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
      await networkService.post(
        Endpoints.movieToWatchlist,
        data: {
          'media_type': 'movie',
          'media_id': movieId,
          'watchlist': addToWatchlist,
        },
      );

      return const Success(unit);
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
      await networkService.post(
        Endpoints.movieToFavorites,
        data: {
          'media_type': 'movie',
          'media_id': movieId,
          'favorite': addToFavorites,
        },
      );

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
      await networkService.post(
        Endpoints.movieRating,
        data: {
          'movie_id': movieId,
          'value': rating,
        },
      );

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
      await networkService.delete(
        Endpoints.movieRating,
        data: {
          'movie_id': movieId,
        },
      );

      return const Success(unit);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
