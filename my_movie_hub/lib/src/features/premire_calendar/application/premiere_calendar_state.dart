import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'premiere_calendar_state.freezed.dart';

@freezed
class PremiereCalendarState with _$PremiereCalendarState {
  const factory PremiereCalendarState({
    @Default([]) List<Movie> movies,
    int? totalMovies,
    @Default(false) bool hasReachedMax,
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String errorMessage,
  }) = _PremiereCalendarState;
}
