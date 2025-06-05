import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/policy_privacy_and_terms_of_use.dart';
import 'package:my_movie_hub/src/core-ui/modals/actions_modal_bottom_sheet.dart';
import 'package:my_movie_hub/src/core-ui/modals/info_modal.dart';
import 'package:my_movie_hub/src/core/constants/external_urls.dart';
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
        child: const SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpaces.s32),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      height: 80,
                      image: AssetImage('assets/png/mmh_logo.png'),
                    ),
                    AppSpaces.gapH16,
                    AppSpaces.gapH24,
                    SignInForm(),
                    AppSpaces.gapH16,
                    PolicyPrivacyAndTermsOfUse(
                      text: 'By logging in, you agree to the',
                    ),
                    AppSpaces.gapH16,
                    _CreateNewAccount(),
                    AppSpaces.gapH16,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateNewAccount extends StatelessWidget {
  const _CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'signIn.notHaveAccountMessage'.tr(),
          style: AppTextStyle.bodyMedium.copyWith(
            color: context.colors.onSurface,
          ),
        ),
        TextButton(
          onPressed: () => showInfoModal(
            context: context,
            content:
                'Para usar My Movie Hub, necesitas\nuna cuenta de TMDB.\n\nPor seguridad, te llevaremos a su web oficial para crearla allí.\n\nCuando termines, vuelve aquí e inicia sesión con tu nueva cuenta.',
            actionButtonText: 'Ir al Registro',
            action: () async {
              final uri = Uri.parse(ExternalUrls.tmdbSignUpUrl);
              await launchUrl(uri);
            },
          ),
          child: Text(
            'signIn.notHaveAccountButtonText'.tr(),
            style: AppTextStyle.button.copyWith(
              color: context.colors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
