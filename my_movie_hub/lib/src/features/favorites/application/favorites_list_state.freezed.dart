// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesListState {
  List<Movie> get movies => throw _privateConstructorUsedError;
  StateStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesListStateCopyWith<FavoritesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesListStateCopyWith<$Res> {
  factory $FavoritesListStateCopyWith(
          FavoritesListState value, $Res Function(FavoritesListState) then) =
      _$FavoritesListStateCopyWithImpl<$Res, FavoritesListState>;
  @useResult
  $Res call({List<Movie> movies, StateStatus status, String errorMessage});
}

/// @nodoc
class _$FavoritesListStateCopyWithImpl<$Res, $Val extends FavoritesListState>
    implements $FavoritesListStateCopyWith<$Res> {
  _$FavoritesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
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
abstract class _$$FavoritesListStateImplCopyWith<$Res>
    implements $FavoritesListStateCopyWith<$Res> {
  factory _$$FavoritesListStateImplCopyWith(_$FavoritesListStateImpl value,
          $Res Function(_$FavoritesListStateImpl) then) =
      __$$FavoritesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie> movies, StateStatus status, String errorMessage});
}

/// @nodoc
class __$$FavoritesListStateImplCopyWithImpl<$Res>
    extends _$FavoritesListStateCopyWithImpl<$Res, _$FavoritesListStateImpl>
    implements _$$FavoritesListStateImplCopyWith<$Res> {
  __$$FavoritesListStateImplCopyWithImpl(_$FavoritesListStateImpl _value,
      $Res Function(_$FavoritesListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$FavoritesListStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
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

class _$FavoritesListStateImpl implements _FavoritesListState {
  const _$FavoritesListStateImpl(
      {final List<Movie> movies = const [],
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
  final StateStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'FavoritesListState(movies: $movies, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesListStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_movies), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesListStateImplCopyWith<_$FavoritesListStateImpl> get copyWith =>
      __$$FavoritesListStateImplCopyWithImpl<_$FavoritesListStateImpl>(
          this, _$identity);
}

abstract class _FavoritesListState implements FavoritesListState {
  const factory _FavoritesListState(
      {final List<Movie> movies,
      final StateStatus status,
      final String errorMessage}) = _$FavoritesListStateImpl;

  @override
  List<Movie> get movies;
  @override
  StateStatus get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$FavoritesListStateImplCopyWith<_$FavoritesListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
