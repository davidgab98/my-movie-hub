import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'movie_detail_state.freezed.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    @Default(DetailedMovie(id: -1)) DetailedMovie movie,
    @Default(StateStatus.initial) StateStatus status,
    @Default(StateStatus.initial) StateStatus toggleFavoritesStatus,
    @Default(StateStatus.initial) StateStatus toggleWatchlistStatus,
    @Default(StateStatus.initial) StateStatus addRatingStatus,
    @Default(StateStatus.initial) StateStatus removeRatingStatus,
    @Default('') String errorMessage,
  }) = _MovieDetailState;
}
