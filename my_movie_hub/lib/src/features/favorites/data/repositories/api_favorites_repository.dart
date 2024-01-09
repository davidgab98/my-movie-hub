import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

class ApiFavoritesRepository extends FavoritesRepository {
  ApiFavoritesRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<List<Movie>, Exception>> getFavoriteMovies() async {
    try {
      final response = await networkService.get(Endpoints.favoriteMovies);

      List<Movie> result = [];
      result = (response.data['results'] as List)
          .map((json) => Movie.fromJson(json as Map<String, Object?>))
          .toList();

      return Success(result);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
