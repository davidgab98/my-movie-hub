import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'watchlist_state.freezed.dart';

enum OrderType {
  asc,
  desc;

  @override
  String toString() {
    switch (this) {
      case asc:
        return 'Ascendent';
      case desc:
        return 'Descendent';
    }
  }

  String toApi() {
    switch (this) {
      case asc:
        return 'created_at.asc';
      case desc:
        return 'created_at.desc';
    }
  }
}

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState({
    @Default([]) List<Movie> movies,
    int? totalMovies,
    @Default(OrderType.asc) OrderType orderType,
    @Default(false) bool hasReachedMax,
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String errorMessage,
  }) = _WatchlistState;
}
