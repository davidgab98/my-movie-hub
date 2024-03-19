// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  int? get totalMovies => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  ListDisplayMode get listDisplayMode => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {List<Movie> movies,
      String query,
      String year,
      int? totalMovies,
      bool hasReachedMax,
      ListDisplayMode listDisplayMode,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? query = null,
    Object? year = null,
    Object? totalMovies = freezed,
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
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      totalMovies: freezed == totalMovies
          ? _value.totalMovies
          : totalMovies // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Movie> movies,
      String query,
      String year,
      int? totalMovies,
      bool hasReachedMax,
      ListDisplayMode listDisplayMode,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? query = null,
    Object? year = null,
    Object? totalMovies = freezed,
    Object? hasReachedMax = null,
    Object? listDisplayMode = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$SearchStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      totalMovies: freezed == totalMovies
          ? _value.totalMovies
          : totalMovies // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {final List<Movie> movies = const [],
      this.query = '',
      this.year = '',
      this.totalMovies,
      this.hasReachedMax = false,
      this.listDisplayMode = ListDisplayMode.grid3,
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
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final String year;
  @override
  final int? totalMovies;
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
    return 'SearchState(movies: $movies, query: $query, year: $year, totalMovies: $totalMovies, hasReachedMax: $hasReachedMax, listDisplayMode: $listDisplayMode, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalMovies, totalMovies) ||
                other.totalMovies == totalMovies) &&
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
      query,
      year,
      totalMovies,
      hasReachedMax,
      listDisplayMode,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final List<Movie> movies,
      final String query,
      final String year,
      final int? totalMovies,
      final bool hasReachedMax,
      final ListDisplayMode listDisplayMode,
      final StateStatus status,
      final String errorMessage}) = _$SearchStateImpl;

  @override
  List<Movie> get movies;
  @override
  String get query;
  @override
  String get year;
  @override
  int? get totalMovies;
  @override
  bool get hasReachedMax;
  @override
  ListDisplayMode get listDisplayMode;
  @override
  StateStatus get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
