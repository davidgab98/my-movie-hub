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
  $Res call({StateStatus accountStatesStatus, String errorMessage});
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
    Object? accountStatesStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
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
}

/// @nodoc
abstract class _$$MovieItemStateImplCopyWith<$Res>
    implements $MovieItemStateCopyWith<$Res> {
  factory _$$MovieItemStateImplCopyWith(_$MovieItemStateImpl value,
          $Res Function(_$MovieItemStateImpl) then) =
      __$$MovieItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus accountStatesStatus, String errorMessage});
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
    Object? accountStatesStatus = null,
    Object? errorMessage = null,
  }) {
    return _then(_$MovieItemStateImpl(
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
      {this.accountStatesStatus = StateStatus.initial, this.errorMessage = ''});

  @override
  @JsonKey()
  final StateStatus accountStatesStatus;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'MovieItemState(accountStatesStatus: $accountStatesStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieItemStateImpl &&
            (identical(other.accountStatesStatus, accountStatesStatus) ||
                other.accountStatesStatus == accountStatesStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accountStatesStatus, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieItemStateImplCopyWith<_$MovieItemStateImpl> get copyWith =>
      __$$MovieItemStateImplCopyWithImpl<_$MovieItemStateImpl>(
          this, _$identity);
}

abstract class _MovieItemState implements MovieItemState {
  const factory _MovieItemState(
      {final StateStatus accountStatesStatus,
      final String errorMessage}) = _$MovieItemStateImpl;

  @override
  StateStatus get accountStatesStatus;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MovieItemStateImplCopyWith<_$MovieItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
