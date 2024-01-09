import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

abstract class FavoritesRepository {
  Future<Result<List<Movie>, Exception>> getFavoriteMovies();
}
