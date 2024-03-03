import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';
import 'package:my_movie_hub/src/features/ratings/domain/repositories/ratings_repository.dart';

class MockRatingsRepository extends RatingsRepository {
  MockRatingsRepository();

  @override
  Future<Result<MovieListResponse, Exception>> getRatedMovies({
    required int page,
    OrderType orderType = OrderType.desc,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));

      return const Success(MovieListResponse());
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
