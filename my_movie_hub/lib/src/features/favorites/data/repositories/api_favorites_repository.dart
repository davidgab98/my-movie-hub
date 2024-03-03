import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

class ApiFavoritesRepository extends FavoritesRepository {
  ApiFavoritesRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<MovieListResponse, Exception>> getFavoriteMovies({
    required int page,
    OrderType orderType = OrderType.desc,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.favoriteMovies,
        queryParameters: {
          'page': page,
          'sort_by': orderType.toApi(),
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
