// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

abstract class PremieresRepository {
  Future<Result<MovieListResponse, Exception>> getPremieres({
    required int page,
    required DateTime initialDate,
    required String countryCode,
  });
}
