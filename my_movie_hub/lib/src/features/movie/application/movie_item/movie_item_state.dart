import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'movie_item_state.freezed.dart';

@freezed
class MovieItemState with _$MovieItemState {
  const factory MovieItemState({
    required Movie movie,
    @Default(StateStatus.initial) StateStatus toggleFavoritesStatus,
    @Default(StateStatus.initial) StateStatus toggleWatchlistStatus,
    @Default(StateStatus.initial) StateStatus addRatingStatus,
    @Default(StateStatus.initial) StateStatus removeRatingStatus,
    @Default(StateStatus.initial) StateStatus accountStatesStatus,
    @Default('') String errorMessage,
  }) = _MovieItemState;
}
