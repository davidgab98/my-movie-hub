import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';

part 'movie_account_states_state.freezed.dart';

@freezed
class MovieAccountStatesState with _$MovieAccountStatesState {
  const factory MovieAccountStatesState({
    @Default(false) bool isFavorite,
    @Default(false) bool isInWatchlist,
    int? rating,
    @Default(StateStatus.initial) StateStatus toggleFavoritesStatus,
    @Default(StateStatus.initial) StateStatus toggleWatchlistStatus,
    @Default(StateStatus.initial) StateStatus addRatingStatus,
    @Default(StateStatus.initial) StateStatus removeRatingStatus,
    @Default(StateStatus.initial) StateStatus getAccountStatesStatus,
    @Default('') String errorMessage,
  }) = _MovieAccountStatesState;
}
