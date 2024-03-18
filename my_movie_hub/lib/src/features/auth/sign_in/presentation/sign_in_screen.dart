import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/application/sign_in_cubit.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/presentation/sign_in_form.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignInCubit(
          signInRepository: locator<SignInRepository>(),
          userCubit: locator<UserCubit>(),
          localStorageService: locator<LocalStorageService>(),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpaces.s32),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSpaces.gapH64,
                  Stack(
                    children: [
                      Icon(
                        Icons.movie_filter,
                        size: 132,
                        color: Colors.blueGrey.shade200,
                      ),
                      Icon(
                        Icons.movie_filter,
                        size: 128,
                        color: Colors.blueGrey.shade400,
                      ),
                      Icon(
                        Icons.movie_filter,
                        size: 124,
                        color: Colors.blueGrey.shade600,
                      ),
                      Icon(
                        Icons.movie_filter,
                        size: 120,
                        color: Colors.blueGrey.shade800,
                      ),
                    ],
                  ),
                  AppSpaces.gapH16,
                  Text(
                    'MY MOVIE HUB',
                    style: AppTextStyle.headlineLarge.copyWith(
                      fontSize: 22,
                      color: context.colors.onBackground,
                    ),
                  ),
                  AppSpaces.gapH24,
                  const SignInForm(),
                  AppSpaces.gapH32,
                  const _CreateNewAccount(),
                  AppSpaces.gapH16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateNewAccount extends StatelessWidget {
  const _CreateNewAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('¿No estás registrado?',
            style: AppTextStyle.bodySmall.copyWith(
              color: context.colors.onBackground,
            )),
        TextButton(
          onPressed: () async {
            //TODO: Save url in const
            final uri = Uri.parse('https://www.themoviedb.org/signup');
            await launchUrl(uri);
          },
          child: Text(
            'Crea un usuario',
            style: AppTextStyle.button.copyWith(
              color: context.colors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
