// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieDetailState {
  DetailedMovie get movie => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  StateStatus get toggleFavoritesStatus => throw _privateConstructorUsedError;
  StateStatus get toggleWatchlistStatus => throw _privateConstructorUsedError;
  StateStatus get addRatingStatus => throw _privateConstructorUsedError;
  StateStatus get removeRatingStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailStateCopyWith<MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailStateCopyWith(
          MovieDetailState value, $Res Function(MovieDetailState) then) =
      _$MovieDetailStateCopyWithImpl<$Res, MovieDetailState>;
  @useResult
  $Res call(
      {DetailedMovie movie,
      StateStatus status,
      StateStatus toggleFavoritesStatus,
      StateStatus toggleWatchlistStatus,
      StateStatus addRatingStatus,
      StateStatus removeRatingStatus,
      String errorMessage});

  $DetailedMovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res, $Val extends MovieDetailState>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? status = null,
    Object? toggleFavoritesStatus = null,
    Object? toggleWatchlistStatus = null,
    Object? addRatingStatus = null,
    Object? removeRatingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as DetailedMovie,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      toggleFavoritesStatus: null == toggleFavoritesStatus
          ? _value.toggleFavoritesStatus
          : toggleFavoritesStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      toggleWatchlistStatus: null == toggleWatchlistStatus
          ? _value.toggleWatchlistStatus
          : toggleWatchlistStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      addRatingStatus: null == addRatingStatus
          ? _value.addRatingStatus
          : addRatingStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      removeRatingStatus: null == removeRatingStatus
          ? _value.removeRatingStatus
          : removeRatingStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailedMovieCopyWith<$Res> get movie {
    return $DetailedMovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieDetailStateImplCopyWith<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  factory _$$MovieDetailStateImplCopyWith(_$MovieDetailStateImpl value,
          $Res Function(_$MovieDetailStateImpl) then) =
      __$$MovieDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetailedMovie movie,
      StateStatus status,
      StateStatus toggleFavoritesStatus,
      StateStatus toggleWatchlistStatus,
      StateStatus addRatingStatus,
      StateStatus removeRatingStatus,
      String errorMessage});

  @override
  $DetailedMovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$MovieDetailStateImplCopyWithImpl<$Res>
    extends _$MovieDetailStateCopyWithImpl<$Res, _$MovieDetailStateImpl>
    implements _$$MovieDetailStateImplCopyWith<$Res> {
  __$$MovieDetailStateImplCopyWithImpl(_$MovieDetailStateImpl _value,
      $Res Function(_$MovieDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? status = null,
    Object? toggleFavoritesStatus = null,
    Object? toggleWatchlistStatus = null,
    Object? addRatingStatus = null,
    Object? removeRatingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MovieDetailStateImpl(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as DetailedMovie,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      toggleFavoritesStatus: null == toggleFavoritesStatus
          ? _value.toggleFavoritesStatus
          : toggleFavoritesStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      toggleWatchlistStatus: null == toggleWatchlistStatus
          ? _value.toggleWatchlistStatus
          : toggleWatchlistStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      addRatingStatus: null == addRatingStatus
          ? _value.addRatingStatus
          : addRatingStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      removeRatingStatus: null == removeRatingStatus
          ? _value.removeRatingStatus
          : removeRatingStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieDetailStateImpl implements _MovieDetailState {
  const _$MovieDetailStateImpl(
      {this.movie = const DetailedMovie(id: -1),
      this.status = StateStatus.initial,
      this.toggleFavoritesStatus = StateStatus.initial,
      this.toggleWatchlistStatus = StateStatus.initial,
      this.addRatingStatus = StateStatus.initial,
      this.removeRatingStatus = StateStatus.initial,
      this.errorMessage = ''});

  @override
  @JsonKey()
  final DetailedMovie movie;
  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final StateStatus toggleFavoritesStatus;
  @override
  @JsonKey()
  final StateStatus toggleWatchlistStatus;
  @override
  @JsonKey()
  final StateStatus addRatingStatus;
  @override
  @JsonKey()
  final StateStatus removeRatingStatus;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'MovieDetailState(movie: $movie, status: $status, toggleFavoritesStatus: $toggleFavoritesStatus, toggleWatchlistStatus: $toggleWatchlistStatus, addRatingStatus: $addRatingStatus, removeRatingStatus: $removeRatingStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailStateImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.toggleFavoritesStatus, toggleFavoritesStatus) ||
                other.toggleFavoritesStatus == toggleFavoritesStatus) &&
            (identical(other.toggleWatchlistStatus, toggleWatchlistStatus) ||
                other.toggleWatchlistStatus == toggleWatchlistStatus) &&
            (identical(other.addRatingStatus, addRatingStatus) ||
                other.addRatingStatus == addRatingStatus) &&
            (identical(other.removeRatingStatus, removeRatingStatus) ||
                other.removeRatingStatus == removeRatingStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      movie,
      status,
      toggleFavoritesStatus,
      toggleWatchlistStatus,
      addRatingStatus,
      removeRatingStatus,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailStateImplCopyWith<_$MovieDetailStateImpl> get copyWith =>
      __$$MovieDetailStateImplCopyWithImpl<_$MovieDetailStateImpl>(
          this, _$identity);
}

abstract class _MovieDetailState implements MovieDetailState {
  const factory _MovieDetailState(
      {final DetailedMovie movie,
      final StateStatus status,
      final StateStatus toggleFavoritesStatus,
      final StateStatus toggleWatchlistStatus,
      final StateStatus addRatingStatus,
      final StateStatus removeRatingStatus,
      final String errorMessage}) = _$MovieDetailStateImpl;

  @override
  DetailedMovie get movie;
  @override
  StateStatus get status;
  @override
  StateStatus get toggleFavoritesStatus;
  @override
  StateStatus get toggleWatchlistStatus;
  @override
  StateStatus get addRatingStatus;
  @override
  StateStatus get removeRatingStatus;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetailStateImplCopyWith<_$MovieDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
