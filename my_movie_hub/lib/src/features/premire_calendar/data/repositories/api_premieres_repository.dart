import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/premire_calendar/domain/repositories/premieres_repository.dart';

class ApiPremieresRepository extends PremieresRepository {
  ApiPremieresRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<MovieListResponse, Exception>> getPremieres({
    required int page,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.premieres,
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
