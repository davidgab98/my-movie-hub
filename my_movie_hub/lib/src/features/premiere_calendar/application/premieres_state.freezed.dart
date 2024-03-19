// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premieres_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PremieresState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  int? get totalMovies => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PremieresStateCopyWith<PremieresState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremieresStateCopyWith<$Res> {
  factory $PremieresStateCopyWith(
          PremieresState value, $Res Function(PremieresState) then) =
      _$PremieresStateCopyWithImpl<$Res, PremieresState>;
  @useResult
  $Res call(
      {List<Movie> movies,
      int? totalMovies,
      bool hasReachedMax,
      StateStatus status,
      String errorMessage});
}

/// @nodoc
class _$PremieresStateCopyWithImpl<$Res, $Val extends PremieresState>
    implements $PremieresStateCopyWith<$Res> {
  _$PremieresStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$PremiereStateImplCopyWith<$Res>
    implements $PremieresStateCopyWith<$Res> {
  factory _$$PremiereStateImplCopyWith(
          _$PremiereStateImpl value, $Res Function(_$PremiereStateImpl) then) =
      __$$PremiereStateImplCopyWithImpl<$Res>;
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
class __$$PremiereStateImplCopyWithImpl<$Res>
    extends _$PremieresStateCopyWithImpl<$Res, _$PremiereStateImpl>
    implements _$$PremiereStateImplCopyWith<$Res> {
  __$$PremiereStateImplCopyWithImpl(
      _$PremiereStateImpl _value, $Res Function(_$PremiereStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? totalMovies = freezed,
    Object? hasReachedMax = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$PremiereStateImpl(
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

class _$PremiereStateImpl implements _PremiereState {
  const _$PremiereStateImpl(
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
    return 'PremieresState(movies: $movies, totalMovies: $totalMovies, hasReachedMax: $hasReachedMax, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiereStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiereStateImplCopyWith<_$PremiereStateImpl> get copyWith =>
      __$$PremiereStateImplCopyWithImpl<_$PremiereStateImpl>(this, _$identity);
}

abstract class _PremiereState implements PremieresState {
  const factory _PremiereState(
      {final List<Movie> movies,
      final int? totalMovies,
      final bool hasReachedMax,
      final StateStatus status,
      final String errorMessage}) = _$PremiereStateImpl;

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
  @override
  @JsonKey(ignore: true)
  _$$PremiereStateImplCopyWith<_$PremiereStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
