import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';

part 'movie_item_state.freezed.dart';

@freezed
class MovieItemState with _$MovieItemState {
  const factory MovieItemState({
    @Default(StateStatus.initial) StateStatus accountStatesStatus,
    @Default('') String errorMessage,
  }) = _MovieItemState;
}
