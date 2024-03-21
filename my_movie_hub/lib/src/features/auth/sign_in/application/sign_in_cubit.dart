import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_movie_hub/src/core-ui/forms/sign_in_inputs.dart';
import 'package:my_movie_hub/src/core/exceptions/exceptions_helper.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/application/sign_in_state.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';

class SignInCubit extends Cubit<SignInState> with ExceptionsHelper {
  SignInCubit({
    required SignInRepository signInRepository,
    required UserCubit userCubit,
    required LocalStorageService localStorageService,
  })  : _signInRepository = signInRepository,
        _userCubit = userCubit,
        _localStorageService = localStorageService,
        super(const SignInState());

  final SignInRepository _signInRepository;
  final UserCubit _userCubit;
  final LocalStorageService _localStorageService;

  void usernameChanged(String value) {
    final username = UsernameInput.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isFormValid: Formz.validate([username, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordInput.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isFormValid: Formz.validate([state.username, password]),
      ),
    );
  }

  Future<void> signIn() async {
    if (!state.isFormValid) {
      emit(
        state.copyWith(
          username: UsernameInput.dirty(state.username.value),
          password: PasswordInput.dirty(state.password.value),
        ),
      );

      return;
    }

    emit(state.copyWith(formStatus: FormzSubmissionStatus.inProgress));

    final result = await _signInRepository.createAndValidateRequestToken(
      username: state.username.value,
      password: state.password.value,
    );

    result.when(
      (success) async {
        await _createSession(requestToken: success);
      },
      (error) => emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          errorMessage: getExceptionMessage(error),
        ),
      ),
    );
  }

  Future<void> _createSession({required String requestToken}) async {
    final result = await _signInRepository.createSession(
      requestToken: requestToken,
    );

    result.when(
      (success) async {
        _localStorageService.setSessionId(success);
        await _getUserAccount(sessionId: success);
      },
      (error) => emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          errorMessage: getExceptionMessage(error),
        ),
      ),
    );
  }

  Future<void> _getUserAccount({required String sessionId}) async {
    final result = await _signInRepository.getUserAccount(
      sessionId: sessionId,
    );

    result.when(
      (success) {
        _localStorageService.setAccountId(success.id);
        _userCubit.updateUserWith(success);
        emit(
          state.copyWith(formStatus: FormzSubmissionStatus.success),
        );
      },
      (error) => emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.failure,
          errorMessage: getExceptionMessage(error),
        ),
      ),
    );
  }
}
