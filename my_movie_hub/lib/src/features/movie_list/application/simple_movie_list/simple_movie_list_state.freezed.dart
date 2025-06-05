// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_movie_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SimpleMovieListState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  int? get totalMovies => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SimpleMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimpleMovieListStateCopyWith<SimpleMovieListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleMovieListStateCopyWith<$Res> {
  factory $SimpleMovieListStateCopyWith(SimpleMovieListState value,
          $Res Function(SimpleMovieListState) then) =
      _$SimpleMovieListStateCopyWithImpl<$Res, SimpleMovieListState>;
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      bool hasReachedMax,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class _$SimpleMovieListStateCopyWithImpl<$Res,
        $Val extends SimpleMovieListState>
    implements $SimpleMovieListStateCopyWith<$Res> {
  _$SimpleMovieListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimpleMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? hasReachedMax = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      totalMovies: freezed == totalMovies
          ? _value.totalMovies
          : totalMovies // ignore: cast_nullable_to_non_nullable
              as int?,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimpleMovieListStateImplCopyWith<$Res>
    implements $SimpleMovieListStateCopyWith<$Res> {
  factory _$$SimpleMovieListStateImplCopyWith(_$SimpleMovieListStateImpl value,
          $Res Function(_$SimpleMovieListStateImpl) then) =
      __$$SimpleMovieListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      bool hasReachedMax,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class __$$SimpleMovieListStateImplCopyWithImpl<$Res>
    extends _$SimpleMovieListStateCopyWithImpl<$Res, _$SimpleMovieListStateImpl>
    implements _$$SimpleMovieListStateImplCopyWith<$Res> {
  __$$SimpleMovieListStateImplCopyWithImpl(_$SimpleMovieListStateImpl _value,
      $Res Function(_$SimpleMovieListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimpleMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? hasReachedMax = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$SimpleMovieListStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      totalMovies: freezed == totalMovies
          ? _value.totalMovies
          : totalMovies // ignore: cast_nullable_to_non_nullable
              as int?,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SimpleMovieListStateImpl implements _SimpleMovieListState {
  const _$SimpleMovieListStateImpl(
      {final List<Movie> movies = const [],
      this.totalMovies,
      this.hasReachedMax = false,
      this.status = StateStatus.initial,
      this.errorMessage = ''})
      : _movies = movies;

  final List<Movie> _movies;
  @override
  @JsonKey()
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  final int? totalMovies;
  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'SimpleMovieListState(movies: $movies, totalMovies: $totalMovies, hasReachedMax: $hasReachedMax, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleMovieListStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.totalMovies, totalMovies) ||
                other.totalMovies == totalMovies) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      totalMovies,
      hasReachedMax,
      status,
      errorMessage);

  /// Create a copy of SimpleMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleMovieListStateImplCopyWith<_$SimpleMovieListStateImpl>
      get copyWith =>
          __$$SimpleMovieListStateImplCopyWithImpl<_$SimpleMovieListStateImpl>(
              this, _$identity);
}

abstract class _SimpleMovieListState implements SimpleMovieListState {
  const factory _SimpleMovieListState(
      {final List<Movie> movies,
      final int? totalMovies,
      final bool hasReachedMax,
      final StateStatus status,
      final String errorMessage}) = _$SimpleMovieListStateImpl;

  @override
  List<Movie> get movies;
  @override
  int? get totalMovies;
  @override
  bool get hasReachedMax;
  @override
  StateStatus get status;
  @override
  String get errorMessage;

  /// Create a copy of SimpleMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimpleMovieListStateImplCopyWith<_$SimpleMovieListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
