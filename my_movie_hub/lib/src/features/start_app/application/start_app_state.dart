import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_app_state.freezed.dart';

enum StartAppStatus {
  initial,
  sessionIdSaved,
  noSessionIdSaved,
  sessionIdExpired,
}

@freezed
class StartAppState with _$StartAppState {
  const factory StartAppState({
    @Default(StartAppStatus.initial) StartAppStatus status,
  }) = _StartApp;
}
