// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

abstract class RatingsRepository {
  Future<Result<MovieListResponse, Exception>> getRatedMovies({
    required int page,
    OrderType orderType = OrderType.desc,
  });
}
