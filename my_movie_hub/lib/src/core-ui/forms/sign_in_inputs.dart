import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';
import 'package:my_movie_hub/src/core-ui/forms/regex_pattern.dart';

/// Username
enum UsernameValidationError {
  empty('signIn.usernameInputEmptyMessage'),
  invalid('signIn.usernameInputInvalidMessage');

  final String translationKey;
  const UsernameValidationError(this.translationKey);

  String get message => translationKey.tr();
}

class UsernameInput extends FormzInput<String, UsernameValidationError> {
  const UsernameInput.pure() : super.pure('');
  const UsernameInput.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    return value.isEmpty
        ? UsernameValidationError.empty
        : !RegexPattern.username.hasMatch(value)
            ? UsernameValidationError.invalid
            : null;
  }
}

/// Password
enum PasswordValidationError {
  empty('signIn.passwordInputEmptyMessage');

  final String translationKey;
  const PasswordValidationError(this.translationKey);

  String get message => translationKey.tr();
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    return value.isEmpty ? PasswordValidationError.empty : null;
  }
}
