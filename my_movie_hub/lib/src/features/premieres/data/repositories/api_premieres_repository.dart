import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/core/utils/datetime_utils.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/premieres/domain/repositories/premieres_repository.dart';

class ApiPremieresRepository extends PremieresRepository {
  ApiPremieresRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<MovieListResponse, Exception>> getPremieres({
    required int page,
    required DateTime initialDate,
    required String countryCode,
  }) async {
    try {
      final initialDateParam = initialDate.toApiFormat();
      final finalDateParam =
          DateTime(initialDate.year, initialDate.month + 1, initialDate.day)
              .toApiFormat();

      final response = await networkService.get(
        Endpoints.discover,
        queryParameters: {
          'page': page,
          'release_date.gte': initialDateParam,
          'release_date.lte': finalDateParam,
          'region': countryCode,
          'sort_by': 'release_date.asc',
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
