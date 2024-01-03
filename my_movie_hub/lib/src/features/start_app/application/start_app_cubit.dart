import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/start_app/application/start_app_state.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';

class StartAppCubit extends Cubit<StartAppState> {
  StartAppCubit({
    required SignInRepository signInRepository,
    required UserCubit userCubit,
    required LocalStorageService localStorageService,
  })  : _signInRepository = signInRepository,
        _userCubit = userCubit,
        _localStorageService = localStorageService,
        super(const StartAppState());

  final SignInRepository _signInRepository;
  final UserCubit _userCubit;
  final LocalStorageService _localStorageService;

  Future<void> init() async {
    final currentSessionId = _localStorageService.getSessionId();

    if (currentSessionId == null) {
      // required for certain app initialization processes to be preloaded
      await Future<void>.delayed(const Duration(microseconds: 1));
      emit(
        state.copyWith(status: StartAppStatus.noSessionIdSaved),
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
          state.copyWith(status: StartAppStatus.sessionIdSaved),
        );
      },
      (error) {
        _localStorageService.removeSessionId();

        emit(
          state.copyWith(status: StartAppStatus.sessionIdExpired),
        );
      },
    );
  }
}
