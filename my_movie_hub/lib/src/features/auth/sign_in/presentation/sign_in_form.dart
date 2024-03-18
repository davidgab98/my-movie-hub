import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core-ui/snackbars/snackbars.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/application/sign_in_cubit.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/application/sign_in_state.dart';
import 'package:ui_kit/ui_kit.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) {
        return (current.formStatus.isFailure &&
                (previous.formStatus != current.formStatus)) ||
            (current.formStatus.isSuccess &&
                (previous.formStatus != current.formStatus));
      },
      listener: (_, state) {
        if (state.formStatus.isFailure) {
          context.showErrorSnackBar(
            context: context,
            message: state.errorMessage ?? 'error.default.signIn'.tr(),
          );
        }
        if (state.formStatus.isSuccess) {
          context.goNamed(AppRoute.home.name);
        }
      },
      child: Column(
        children: [
          _UsernameInput(),
          AppSpaces.gapH16,
          _PasswordInput(),
          AppSpaces.gapH32,
          _SignInButton(),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return MMHTextFormField(
          onChanged: (username) =>
              context.read<SignInCubit>().usernameChanged(username),
          model: MMHTextFormFieldModel(
            labelText: 'Username',
            hintText: 'username',
            errorText: state.username.isNotValid && !state.username.isPure
                ? state.username.error?.message
                : null,
            type: MMHTextFormFieldType.email,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return MMHPasswordFormField(
          onChanged: (password) =>
              context.read<SignInCubit>().passwordChanged(password),
          model: MMHPasswordFormFieldModel(
            labelText: 'Password',
            hintText: '********',
            errorText: state.password.isNotValid && !state.password.isPure
                ? state.password.error?.message
                : null,
          ),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) =>
          previous.isFormValid != current.isFormValid,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2D2F41),
            ),
            onPressed:
                state.isFormValid ? context.read<SignInCubit>().signIn : null,
            child: Text(
              'Login',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
