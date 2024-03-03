// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

abstract class MovieRepository {
  Future<Result<DetailedMovie, Exception>> getMovieDetails({
    required int movieId,
  });

  Future<Result<AccountStates, Exception>> getMovieAccountStates({
    required int movieId,
  });

  Future<Result<Unit, Exception>> toggleMovieWatchlistStatus({
    required int movieId,
    required bool addToWatchlist,
  });

  Future<Result<Unit, Exception>> toggleMovieFavoriteStatus({
    required int movieId,
    required bool addToFavorites,
  });

  Future<Result<Unit, Exception>> addMovieRating({
    required int movieId,
    required double rating,
  });

  Future<Result<Unit, Exception>> removeMovieRating({
    required int movieId,
  });
}
