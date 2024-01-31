// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

abstract class MovieRepository {
  Future<Result<DetailedMovie, Exception>> getMovieDetails(
      {required int movieId});
  Future<Result<Unit, Exception>> getMovieAccountStates({required int movieId});
  Future<Result<Unit, Exception>> addMovieToWatchlist({required int movieId});
  Future<Result<Unit, Exception>> removeMovieFromWatchlist({
    required int movieId,
  });
}
