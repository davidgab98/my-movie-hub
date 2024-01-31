// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Watchlist _$WatchlistFromJson(Map<String, dynamic> json) {
  return _Watchlist.fromJson(json);
}

/// @nodoc
mixin _$Watchlist {
  @JsonKey(name: 'results')
  List<Movie> get movies => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistCopyWith<Watchlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistCopyWith<$Res> {
  factory $WatchlistCopyWith(Watchlist value, $Res Function(Watchlist) then) =
      _$WatchlistCopyWithImpl<$Res, Watchlist>;
  @useResult
  $Res call(
      {@JsonKey(name: 'results') List<Movie> movies,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class _$WatchlistCopyWithImpl<$Res, $Val extends Watchlist>
    implements $WatchlistCopyWith<$Res> {
  _$WatchlistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistImplCopyWith<$Res>
    implements $WatchlistCopyWith<$Res> {
  factory _$$WatchlistImplCopyWith(
          _$WatchlistImpl value, $Res Function(_$WatchlistImpl) then) =
      __$$WatchlistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'results') List<Movie> movies,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class __$$WatchlistImplCopyWithImpl<$Res>
    extends _$WatchlistCopyWithImpl<$Res, _$WatchlistImpl>
    implements _$$WatchlistImplCopyWith<$Res> {
  __$$WatchlistImplCopyWithImpl(
      _$WatchlistImpl _value, $Res Function(_$WatchlistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$WatchlistImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistImpl implements _Watchlist {
  const _$WatchlistImpl(
      {@JsonKey(name: 'results') final List<Movie> movies = const [],
      @JsonKey(name: 'total_pages') this.totalPages = 1,
      @JsonKey(name: 'total_results') this.totalResults = 0})
      : _movies = movies;

  factory _$WatchlistImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistImplFromJson(json);

  final List<Movie> _movies;
  @override
  @JsonKey(name: 'results')
  List<Movie> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'Watchlist(movies: $movies, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_movies), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistImplCopyWith<_$WatchlistImpl> get copyWith =>
      __$$WatchlistImplCopyWithImpl<_$WatchlistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistImplToJson(
      this,
    );
  }
}

abstract class _Watchlist implements Watchlist {
  const factory _Watchlist(
          {@JsonKey(name: 'results') final List<Movie> movies,
          @JsonKey(name: 'total_pages') final int totalPages,
          @JsonKey(name: 'total_results') final int totalResults}) =
      _$WatchlistImpl;

  factory _Watchlist.fromJson(Map<String, dynamic> json) =
      _$WatchlistImpl.fromJson;

  @override
  @JsonKey(name: 'results')
  List<Movie> get movies;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistImplCopyWith<_$WatchlistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
