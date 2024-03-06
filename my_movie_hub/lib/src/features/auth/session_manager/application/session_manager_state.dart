import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_manager_state.freezed.dart';

enum SessionManagerStatus {
  initial,
  sessionIdSaved,
  noSessionIdSaved,
  sessionIdExpired,
}

@freezed
class SessionManagerState with _$SessionManagerState {
  const factory SessionManagerState({
    @Default(SessionManagerStatus.initial) SessionManagerStatus status,
  }) = _SessionManager;
}
