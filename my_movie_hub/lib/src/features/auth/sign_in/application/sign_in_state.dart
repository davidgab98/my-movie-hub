import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core-ui/forms/sign_in__form_inputs.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(UsernameInput.pure()) UsernameInput username,
    @Default(PasswordInput.pure()) PasswordInput password,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formStatus,
    @Default(false) bool isFormValid,
    String? errorMessage,
  }) = _SignIn;
}
