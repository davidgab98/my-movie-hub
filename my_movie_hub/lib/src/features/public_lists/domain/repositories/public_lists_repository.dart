import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

abstract class PublicListsRepository {
  Future<Result<MovieListResponse, Exception>> getPopularMovies({
    required int page,
  });
  Future<Result<MovieListResponse, Exception>> getNowPlayingMovies({
    required int page,
  });
  Future<Result<MovieListResponse, Exception>> getTopRatedMovies({
    required int page,
  });
  Future<Result<MovieListResponse, Exception>> getUpcomingMovies({
    required int page,
  });
  Future<Result<MovieListResponse, Exception>> getTrendingMovies({
    required int page,
  });
}
