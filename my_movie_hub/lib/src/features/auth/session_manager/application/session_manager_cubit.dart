import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/events/events.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/auth/session_manager/application/session_manager_state.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';

class SessionManagerCubit extends Cubit<SessionManagerState> {
  SessionManagerCubit({
    required SignInRepository signInRepository,
    required UserCubit userCubit,
    required LocalStorageService localStorageService,
    required IEventBus eventBus,
  })  : _signInRepository = signInRepository,
        _userCubit = userCubit,
        _localStorageService = localStorageService,
        super(const SessionManagerState()) {
    eventBus.on<LogOutEvent>().listen((event) async {
      return logOut();
    });
  }

  final SignInRepository _signInRepository;
  final UserCubit _userCubit;
  final LocalStorageService _localStorageService;

  Future<void> logOut() async {
    await _signInRepository.logOut();
    _localStorageService.removeAccountId();
    _localStorageService.removeSessionId();
  }

  Future<void> init() async {
    final currentSessionId = _localStorageService.getSessionId();

    if (currentSessionId == null) {
      // required for certain app initialization processes to be preloaded
      await Future<void>.delayed(const Duration(microseconds: 1));
      emit(
        state.copyWith(status: SessionManagerStatus.noSessionIdSaved),
      );
    } else {
      await _getUserAccount(sessionId: currentSessionId);
    }
  }

  Future<void> _getUserAccount({required String sessionId}) async {
    final result = await _signInRepository.getUserAccount(
      sessionId: sessionId,
    );

    result.when(
      (success) {
        _userCubit.updateUserWith(success);
        emit(
          state.copyWith(status: SessionManagerStatus.sessionIdSaved),
        );
      },
      (error) {
        _localStorageService.removeSessionId();

        emit(
          state.copyWith(status: SessionManagerStatus.sessionIdExpired),
        );
      },
    );
  }
}
