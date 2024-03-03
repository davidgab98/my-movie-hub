// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'movie_list_response.freezed.dart';
part 'movie_list_response.g.dart';

@freezed
class MovieListResponse with _$MovieListResponse {
  const factory MovieListResponse({
    @JsonKey(name: 'results') @Default([]) List<Movie> movies,
    @JsonKey(name: 'total_pages') @Default(1) int totalPages,
    @JsonKey(name: 'total_results') @Default(0) int totalResults,
  }) = _MovieListResponse;

  factory MovieListResponse.fromJson(Map<String, Object?> json) =>
      _$MovieListResponseFromJson(json);
}
