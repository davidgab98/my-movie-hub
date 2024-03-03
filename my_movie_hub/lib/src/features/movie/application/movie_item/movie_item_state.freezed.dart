// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieItemState {
  Movie get movie => throw _privateConstructorUsedError;
  StateStatus get toggleFavoritesStatus => throw _privateConstructorUsedError;
  StateStatus get toggleWatchlistStatus => throw _privateConstructorUsedError;
  StateStatus get addRatingStatus => throw _privateConstructorUsedError;
  StateStatus get removeRatingStatus => throw _privateConstructorUsedError;
  StateStatus get accountStatesStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieItemStateCopyWith<MovieItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieItemStateCopyWith<$Res> {
  factory $MovieItemStateCopyWith(
          MovieItemState value, $Res Function(MovieItemState) then) =
      _$MovieItemStateCopyWithImpl<$Res, MovieItemState>;
  @useResult
  $Res call(
      {Movie movie,
      StateStatus toggleFavoritesStatus,
      StateStatus toggleWatchlistStatus,
      StateStatus addRatingStatus,
      StateStatus removeRatingStatus,
      StateStatus accountStatesStatus,
      String errorMessage});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$MovieItemStateCopyWithImpl<$Res, $Val extends MovieItemState>
    implements $MovieItemStateCopyWith<$Res> {
  _$MovieItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? toggleFavoritesStatus = null,
    Object? toggleWatchlistStatus = null,
    Object? addRatingStatus = null,
    Object? removeRatingStatus = null,
    Object? accountStatesStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
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
      accountStatesStatus: null == accountStatesStatus
          ? _value.accountStatesStatus
          : accountStatesStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieItemStateImplCopyWith<$Res>
    implements $MovieItemStateCopyWith<$Res> {
  factory _$$MovieItemStateImplCopyWith(_$MovieItemStateImpl value,
          $Res Function(_$MovieItemStateImpl) then) =
      __$$MovieItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Movie movie,
      StateStatus toggleFavoritesStatus,
      StateStatus toggleWatchlistStatus,
      StateStatus addRatingStatus,
      StateStatus removeRatingStatus,
      StateStatus accountStatesStatus,
      String errorMessage});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$MovieItemStateImplCopyWithImpl<$Res>
    extends _$MovieItemStateCopyWithImpl<$Res, _$MovieItemStateImpl>
    implements _$$MovieItemStateImplCopyWith<$Res> {
  __$$MovieItemStateImplCopyWithImpl(
      _$MovieItemStateImpl _value, $Res Function(_$MovieItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? toggleFavoritesStatus = null,
    Object? toggleWatchlistStatus = null,
    Object? addRatingStatus = null,
    Object? removeRatingStatus = null,
    Object? accountStatesStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MovieItemStateImpl(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
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
      accountStatesStatus: null == accountStatesStatus
          ? _value.accountStatesStatus
          : accountStatesStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieItemStateImpl implements _MovieItemState {
  const _$MovieItemStateImpl(
      {required this.movie,
      this.toggleFavoritesStatus = StateStatus.initial,
      this.toggleWatchlistStatus = StateStatus.initial,
      this.addRatingStatus = StateStatus.initial,
      this.removeRatingStatus = StateStatus.initial,
      this.accountStatesStatus = StateStatus.initial,
      this.errorMessage = ''});

  @override
  final Movie movie;
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
  final StateStatus accountStatesStatus;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'MovieItemState(movie: $movie, toggleFavoritesStatus: $toggleFavoritesStatus, toggleWatchlistStatus: $toggleWatchlistStatus, addRatingStatus: $addRatingStatus, removeRatingStatus: $removeRatingStatus, accountStatesStatus: $accountStatesStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieItemStateImpl &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.toggleFavoritesStatus, toggleFavoritesStatus) ||
                other.toggleFavoritesStatus == toggleFavoritesStatus) &&
            (identical(other.toggleWatchlistStatus, toggleWatchlistStatus) ||
                other.toggleWatchlistStatus == toggleWatchlistStatus) &&
            (identical(other.addRatingStatus, addRatingStatus) ||
                other.addRatingStatus == addRatingStatus) &&
            (identical(other.removeRatingStatus, removeRatingStatus) ||
                other.removeRatingStatus == removeRatingStatus) &&
            (identical(other.accountStatesStatus, accountStatesStatus) ||
                other.accountStatesStatus == accountStatesStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      movie,
      toggleFavoritesStatus,
      toggleWatchlistStatus,
      addRatingStatus,
      removeRatingStatus,
      accountStatesStatus,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieItemStateImplCopyWith<_$MovieItemStateImpl> get copyWith =>
      __$$MovieItemStateImplCopyWithImpl<_$MovieItemStateImpl>(
          this, _$identity);
}

abstract class _MovieItemState implements MovieItemState {
  const factory _MovieItemState(
      {required final Movie movie,
      final StateStatus toggleFavoritesStatus,
      final StateStatus toggleWatchlistStatus,
      final StateStatus addRatingStatus,
      final StateStatus removeRatingStatus,
      final StateStatus accountStatesStatus,
      final String errorMessage}) = _$MovieItemStateImpl;

  @override
  Movie get movie;
  @override
  StateStatus get toggleFavoritesStatus;
  @override
  StateStatus get toggleWatchlistStatus;
  @override
  StateStatus get addRatingStatus;
  @override
  StateStatus get removeRatingStatus;
  @override
  StateStatus get accountStatesStatus;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MovieItemStateImplCopyWith<_$MovieItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
