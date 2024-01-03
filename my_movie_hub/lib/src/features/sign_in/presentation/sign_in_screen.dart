import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/sign_in/application/sign_in_cubit.dart';
import 'package:my_movie_hub/src/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/sign_in/presentation/sign_in_form.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:ui_kit/ui_kit.dart';

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpaces.s32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'MY MOVIE HUB',
                        style: AppTextStyle.headlineLarge,
                      ),
                      AppSpaces.gapH32,
                      const SignInForm(),
                      AppSpaces.gapH32,
                      const _CreateNewAccount(),
                      AppSpaces.gapH16,
                      TextButton(
                        onPressed: () async {
                          try {
                            final response =
                                await locator<NetworkService>().get(
                              '/account/20875012/favorite/movies',
                              queryParameters: {
                                'session_id':
                                    'a1e394a14afd249ac0aca20cae1e6b0d483dbd54',
                              },
                            );
                            print(response);
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text('Obtener los favoritos'),
                      ),
                    ],
                  ),
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
        Text(
          '¿No estás registrado?',
          style: AppTextStyle.bodySmall,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Crea un usuario',
            style: AppTextStyle.button.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
