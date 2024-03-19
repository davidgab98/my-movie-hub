import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/movie_genres.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/search/domain/repositories/search_repository.dart';

class ApiSearchRepository extends SearchRepository {
  ApiSearchRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<MovieListResponse, Exception>> searchMovie({
    required int page,
    String query = '',
    String year = '',
    List<MovieGenre> genres = const [],
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.searchMovie,
        queryParameters: {
          'page': page,
          'query': query.isEmpty && year.isNotEmpty ? 'a' : query,
          'year': year,
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
