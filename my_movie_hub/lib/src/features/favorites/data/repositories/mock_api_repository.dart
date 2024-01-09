import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

class MockFavoritesRepository extends FavoritesRepository {
  MockFavoritesRepository();

  @override
  Future<Result<List<Movie>, Exception>> getFavoriteMovies() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      const result = <Movie>[];

      return const Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
