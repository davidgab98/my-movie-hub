import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'favorites_list_state.freezed.dart';

@freezed
class FavoritesListState with _$FavoritesListState {
  const factory FavoritesListState({
    @Default([]) List<Movie> movies,
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String errorMessage,
  }) = _FavoritesListState;
}
