// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'watchlist.freezed.dart';
part 'watchlist.g.dart';

@freezed
class Watchlist with _$Watchlist {
  const factory Watchlist({
    @JsonKey(name: 'results') @Default([]) List<Movie> movies,
    @JsonKey(name: 'total_pages') @Default(1) int totalPages,
    @JsonKey(name: 'total_results') @Default(0) int totalResults,
  }) = _Watchlist;

  factory Watchlist.fromJson(Map<String, Object?> json) =>
      _$WatchlistFromJson(json);
}
