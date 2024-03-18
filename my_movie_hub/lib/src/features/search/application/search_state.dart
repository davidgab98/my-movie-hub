import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/list_display_modes.dart';
import 'package:my_movie_hub/src/core/enums/movie_genres.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Movie> movies,
    @Default('') String query,
    @Default('') String year,
    @Default([]) List<MovieGenre> genres,
    int? totalMovies,
    @Default(false) bool hasReachedMax,
    @Default(ListDisplayMode.grid3) ListDisplayMode listDisplayMode,
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String errorMessage,
  }) = _SearchState;
}
