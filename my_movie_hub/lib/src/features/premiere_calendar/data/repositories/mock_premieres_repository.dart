import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/premiere_calendar/domain/repositories/premieres_repository.dart';

class MockPremieresRepository extends PremieresRepository {
  MockPremieresRepository();

  @override
  Future<Result<MovieListResponse, Exception>> getPremieres({
    required int page,
    required DateTime initialDate,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(MovieListResponse());
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
