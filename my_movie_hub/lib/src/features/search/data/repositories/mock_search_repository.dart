import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/movie_genres.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/search/domain/repositories/search_repository.dart';

class MockSearchRepository extends SearchRepository {
  MockSearchRepository();

  @override
  Future<Result<MovieListResponse, Exception>> searchMovie({
    required int page,
    String query = '',
    String year = '',
    List<MovieGenre> genres = const [],
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(MovieListResponse());
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
