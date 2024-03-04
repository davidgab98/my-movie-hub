// movie_list_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/enums/order_type.dart';
import 'package:my_movie_hub/src/core/enums/state_status.dart';
import 'package:my_movie_hub/src/features/movie/domain/model/movie.dart';

part 'complex_movie_list_state.freezed.dart';

enum ListDisplayMode { listWithImages, grid, list }

@freezed
class ComplexMovieListState with _$ComplexMovieListState {
  const factory ComplexMovieListState({
    @Default([]) List<Movie> movies,
    int? totalMovies,
    @Default(OrderType.desc) OrderType orderType,
    @Default(false) bool hasReachedMax,
    @Default(ListDisplayMode.listWithImages) ListDisplayMode listDisplayMode,
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String errorMessage,
  }) = _ComplexMovieListState;
}
