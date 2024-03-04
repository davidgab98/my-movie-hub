import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/public_lists/domain/repositories/public_lists_repository.dart';

class ApiPublicListsRepository extends PublicListsRepository {
  ApiPublicListsRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<MovieListResponse, Exception>> getPopularMovies({
    required int page,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.popularMovies,
        queryParameters: {'page': page},
      );

      final MovieListResponse result =
          MovieListResponse.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<MovieListResponse, Exception>> getNowPlayingMovies({
    required int page,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.nowPlayingMovies,
        queryParameters: {'page': page},
      );

      final MovieListResponse result =
          MovieListResponse.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<MovieListResponse, Exception>> getTopRatedMovies({
    required int page,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.topRatedMovies,
        queryParameters: {'page': page},
      );

      final MovieListResponse result =
          MovieListResponse.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<MovieListResponse, Exception>> getUpcomingMovies({
    required int page,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.upcomingMovies,
        queryParameters: {'page': page},
      );

      final MovieListResponse result =
          MovieListResponse.fromJson(response.data as Map<String, Object?>);

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<MovieListResponse, Exception>> getTrendingMovies({
    required int page,
  }) async {
    try {
      final response = await networkService.get(
        '${Endpoints.trendingMovies}/day',
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
}
