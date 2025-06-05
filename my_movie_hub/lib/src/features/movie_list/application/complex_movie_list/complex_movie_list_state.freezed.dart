// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complex_movie_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComplexMovieListState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  int? get totalMovies => throw _privateConstructorUsedError;
  OrderType get orderType => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  ListDisplayMode get listDisplayMode => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ComplexMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComplexMovieListStateCopyWith<ComplexMovieListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplexMovieListStateCopyWith<$Res> {
  factory $ComplexMovieListStateCopyWith(ComplexMovieListState value,
          $Res Function(ComplexMovieListState) then) =
      _$ComplexMovieListStateCopyWithImpl<$Res, ComplexMovieListState>;
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      OrderType orderType,
      bool hasReachedMax,
      ListDisplayMode listDisplayMode,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class _$ComplexMovieListStateCopyWithImpl<$Res,
        $Val extends ComplexMovieListState>
    implements $ComplexMovieListStateCopyWith<$Res> {
  _$ComplexMovieListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComplexMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? orderType = null,
    Object? hasReachedMax = null,
    Object? listDisplayMode = null,
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
      listDisplayMode: null == listDisplayMode
          ? _value.listDisplayMode
          : listDisplayMode // ignore: cast_nullable_to_non_nullable
              as ListDisplayMode,
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
abstract class _$$ComplexMovieListStateImplCopyWith<$Res>
    implements $ComplexMovieListStateCopyWith<$Res> {
  factory _$$ComplexMovieListStateImplCopyWith(
          _$ComplexMovieListStateImpl value,
          $Res Function(_$ComplexMovieListStateImpl) then) =
      __$$ComplexMovieListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      OrderType orderType,
      bool hasReachedMax,
      ListDisplayMode listDisplayMode,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class __$$ComplexMovieListStateImplCopyWithImpl<$Res>
    extends _$ComplexMovieListStateCopyWithImpl<$Res,
        _$ComplexMovieListStateImpl>
    implements _$$ComplexMovieListStateImplCopyWith<$Res> {
  __$$ComplexMovieListStateImplCopyWithImpl(_$ComplexMovieListStateImpl _value,
      $Res Function(_$ComplexMovieListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComplexMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? orderType = null,
    Object? hasReachedMax = null,
    Object? listDisplayMode = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ComplexMovieListStateImpl(
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
      listDisplayMode: null == listDisplayMode
          ? _value.listDisplayMode
          : listDisplayMode // ignore: cast_nullable_to_non_nullable
              as ListDisplayMode,
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

class _$ComplexMovieListStateImpl implements _ComplexMovieListState {
  const _$ComplexMovieListStateImpl(
      {final List<Movie> movies = const [],
      this.totalMovies,
      this.orderType = OrderType.desc,
      this.hasReachedMax = false,
      this.listDisplayMode = ListDisplayMode.listWithImages,
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
  final ListDisplayMode listDisplayMode;
  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'ComplexMovieListState(movies: $movies, totalMovies: $totalMovies, orderType: $orderType, hasReachedMax: $hasReachedMax, listDisplayMode: $listDisplayMode, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplexMovieListStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.totalMovies, totalMovies) ||
                other.totalMovies == totalMovies) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.listDisplayMode, listDisplayMode) ||
                other.listDisplayMode == listDisplayMode) &&
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
      listDisplayMode,
      status,
      errorMessage);

  /// Create a copy of ComplexMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplexMovieListStateImplCopyWith<_$ComplexMovieListStateImpl>
      get copyWith => __$$ComplexMovieListStateImplCopyWithImpl<
          _$ComplexMovieListStateImpl>(this, _$identity);
}

abstract class _ComplexMovieListState implements ComplexMovieListState {
  const factory _ComplexMovieListState(
      {final List<Movie> movies,
      final int? totalMovies,
      final OrderType orderType,
      final bool hasReachedMax,
      final ListDisplayMode listDisplayMode,
      final StateStatus status,
      final String errorMessage}) = _$ComplexMovieListStateImpl;

  @override
  List<Movie> get movies;
  @override
  int? get totalMovies;
  @override
  OrderType get orderType;
  @override
  bool get hasReachedMax;
  @override
  ListDisplayMode get listDisplayMode;
  @override
  StateStatus get status;
  @override
  String get errorMessage;

  /// Create a copy of ComplexMovieListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplexMovieListStateImplCopyWith<_$ComplexMovieListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
