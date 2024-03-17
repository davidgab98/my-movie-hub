// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_account_states_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieAccountStatesState {
  AccountStates? get accountStates => throw _privateConstructorUsedError;
  StateStatus get toggleFavoritesStatus => throw _privateConstructorUsedError;
  StateStatus get toggleWatchlistStatus => throw _privateConstructorUsedError;
  StateStatus get addRatingStatus => throw _privateConstructorUsedError;
  StateStatus get removeRatingStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieAccountStatesStateCopyWith<MovieAccountStatesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieAccountStatesStateCopyWith<$Res> {
  factory $MovieAccountStatesStateCopyWith(MovieAccountStatesState value,
          $Res Function(MovieAccountStatesState) then) =
      _$MovieAccountStatesStateCopyWithImpl<$Res, MovieAccountStatesState>;
  @useResult
  $Res call(
      {AccountStates? accountStates,
      StateStatus toggleFavoritesStatus,
      StateStatus toggleWatchlistStatus,
      StateStatus addRatingStatus,
      StateStatus removeRatingStatus,
      String errorMessage});

  $AccountStatesCopyWith<$Res>? get accountStates;
}

/// @nodoc
class _$MovieAccountStatesStateCopyWithImpl<$Res,
        $Val extends MovieAccountStatesState>
    implements $MovieAccountStatesStateCopyWith<$Res> {
  _$MovieAccountStatesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountStates = freezed,
    Object? toggleFavoritesStatus = null,
    Object? toggleWatchlistStatus = null,
    Object? addRatingStatus = null,
    Object? removeRatingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      accountStates: freezed == accountStates
          ? _value.accountStates
          : accountStates // ignore: cast_nullable_to_non_nullable
              as AccountStates?,
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
  $AccountStatesCopyWith<$Res>? get accountStates {
    if (_value.accountStates == null) {
      return null;
    }

    return $AccountStatesCopyWith<$Res>(_value.accountStates!, (value) {
      return _then(_value.copyWith(accountStates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieAccountStatesStateImplCopyWith<$Res>
    implements $MovieAccountStatesStateCopyWith<$Res> {
  factory _$$MovieAccountStatesStateImplCopyWith(
          _$MovieAccountStatesStateImpl value,
          $Res Function(_$MovieAccountStatesStateImpl) then) =
      __$$MovieAccountStatesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AccountStates? accountStates,
      StateStatus toggleFavoritesStatus,
      StateStatus toggleWatchlistStatus,
      StateStatus addRatingStatus,
      StateStatus removeRatingStatus,
      String errorMessage});

  @override
  $AccountStatesCopyWith<$Res>? get accountStates;
}

/// @nodoc
class __$$MovieAccountStatesStateImplCopyWithImpl<$Res>
    extends _$MovieAccountStatesStateCopyWithImpl<$Res,
        _$MovieAccountStatesStateImpl>
    implements _$$MovieAccountStatesStateImplCopyWith<$Res> {
  __$$MovieAccountStatesStateImplCopyWithImpl(
      _$MovieAccountStatesStateImpl _value,
      $Res Function(_$MovieAccountStatesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountStates = freezed,
    Object? toggleFavoritesStatus = null,
    Object? toggleWatchlistStatus = null,
    Object? addRatingStatus = null,
    Object? removeRatingStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MovieAccountStatesStateImpl(
      accountStates: freezed == accountStates
          ? _value.accountStates
          : accountStates // ignore: cast_nullable_to_non_nullable
              as AccountStates?,
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

class _$MovieAccountStatesStateImpl implements _MovieAccountStatesState {
  const _$MovieAccountStatesStateImpl(
      {this.accountStates,
      this.toggleFavoritesStatus = StateStatus.initial,
      this.toggleWatchlistStatus = StateStatus.initial,
      this.addRatingStatus = StateStatus.initial,
      this.removeRatingStatus = StateStatus.initial,
      this.errorMessage = ''});

  @override
  final AccountStates? accountStates;
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
    return 'MovieAccountStatesState(accountStates: $accountStates, toggleFavoritesStatus: $toggleFavoritesStatus, toggleWatchlistStatus: $toggleWatchlistStatus, addRatingStatus: $addRatingStatus, removeRatingStatus: $removeRatingStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieAccountStatesStateImpl &&
            (identical(other.accountStates, accountStates) ||
                other.accountStates == accountStates) &&
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
      accountStates,
      toggleFavoritesStatus,
      toggleWatchlistStatus,
      addRatingStatus,
      removeRatingStatus,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieAccountStatesStateImplCopyWith<_$MovieAccountStatesStateImpl>
      get copyWith => __$$MovieAccountStatesStateImplCopyWithImpl<
          _$MovieAccountStatesStateImpl>(this, _$identity);
}

abstract class _MovieAccountStatesState implements MovieAccountStatesState {
  const factory _MovieAccountStatesState(
      {final AccountStates? accountStates,
      final StateStatus toggleFavoritesStatus,
      final StateStatus toggleWatchlistStatus,
      final StateStatus addRatingStatus,
      final StateStatus removeRatingStatus,
      final String errorMessage}) = _$MovieAccountStatesStateImpl;

  @override
  AccountStates? get accountStates;
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
  _$$MovieAccountStatesStateImplCopyWith<_$MovieAccountStatesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
