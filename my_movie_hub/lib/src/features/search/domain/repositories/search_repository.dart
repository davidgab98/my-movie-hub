// ignore_for_file: one_member_abstracts
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/enums/movie_genres.dart';
import 'package:my_movie_hub/src/features/movie_list/domain/models/movie_list_response.dart';

abstract class SearchRepository {
  Future<Result<MovieListResponse, Exception>> searchMovie({
    required int page,
    String query = '',
    String year = '',
    List<MovieGenre> genres = const [],
  });
}
