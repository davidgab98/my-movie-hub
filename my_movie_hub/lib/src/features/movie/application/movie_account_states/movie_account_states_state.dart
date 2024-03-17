import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'movie_account_states_state.freezed.dart';

@freezed
class MovieAccountStatesState with _$MovieAccountStatesState {
  const factory MovieAccountStatesState({
    AccountStates? accountStates,
    @Default(StateStatus.initial) StateStatus toggleFavoritesStatus,
    @Default(StateStatus.initial) StateStatus toggleWatchlistStatus,
    @Default(StateStatus.initial) StateStatus addRatingStatus,
    @Default(StateStatus.initial) StateStatus removeRatingStatus,
    @Default('') String errorMessage,
  }) = _MovieAccountStatesState;
}
