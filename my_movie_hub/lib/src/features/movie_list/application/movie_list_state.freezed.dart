// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieListState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  int? get totalMovies => throw _privateConstructorUsedError;
  OrderType get orderType => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListStateCopyWith<MovieListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListStateCopyWith<$Res> {
  factory $MovieListStateCopyWith(
          MovieListState value, $Res Function(MovieListState) then) =
      _$MovieListStateCopyWithImpl<$Res, MovieListState>;
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      OrderType orderType,
      bool hasReachedMax,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class _$MovieListStateCopyWithImpl<$Res, $Val extends MovieListState>
    implements $MovieListStateCopyWith<$Res> {
  _$MovieListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? orderType = null,
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
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
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
abstract class _$$MovieListStateImplCopyWith<$Res>
    implements $MovieListStateCopyWith<$Res> {
  factory _$$MovieListStateImplCopyWith(_$MovieListStateImpl value,
          $Res Function(_$MovieListStateImpl) then) =
      __$$MovieListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      OrderType orderType,
      bool hasReachedMax,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class __$$MovieListStateImplCopyWithImpl<$Res>
    extends _$MovieListStateCopyWithImpl<$Res, _$MovieListStateImpl>
    implements _$$MovieListStateImplCopyWith<$Res> {
  __$$MovieListStateImplCopyWithImpl(
      _$MovieListStateImpl _value, $Res Function(_$MovieListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? orderType = null,
    Object? hasReachedMax = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MovieListStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      totalMovies: freezed == totalMovies
          ? _value.totalMovies
          : totalMovies // ignore: cast_nullable_to_non_nullable
              as int?,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
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

class _$MovieListStateImpl implements _MovieListState {
  const _$MovieListStateImpl(
      {final List<Movie> movies = const [],
      this.totalMovies,
      this.orderType = OrderType.desc,
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
  final OrderType orderType;
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
    return 'MovieListState(movies: $movies, totalMovies: $totalMovies, orderType: $orderType, hasReachedMax: $hasReachedMax, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.totalMovies, totalMovies) ||
                other.totalMovies == totalMovies) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
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
      orderType,
      hasReachedMax,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListStateImplCopyWith<_$MovieListStateImpl> get copyWith =>
      __$$MovieListStateImplCopyWithImpl<_$MovieListStateImpl>(
          this, _$identity);
}

abstract class _MovieListState implements MovieListState {
  const factory _MovieListState(
      {final List<Movie> movies,
      final int? totalMovies,
      final OrderType orderType,
      final bool hasReachedMax,
      final StateStatus status,
      final String errorMessage}) = _$MovieListStateImpl;

  @override
  List<Movie> get movies;
  @override
  int? get totalMovies;
  @override
  OrderType get orderType;
  @override
  bool get hasReachedMax;
  @override
  StateStatus get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MovieListStateImplCopyWith<_$MovieListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}