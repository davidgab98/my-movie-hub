import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/start_app/application/start_app_cubit.dart';
import 'package:my_movie_hub/src/features/start_app/application/start_app_state.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:ui_kit/ui_kit.dart';

class StartAppScreen extends StatelessWidget {
  const StartAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StartAppCubit>(
      create: (context) => StartAppCubit(
        signInRepository: locator<SignInRepository>(),
        userCubit: locator<UserCubit>(),
        localStorageService: locator<LocalStorageService>(),
      )..init(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartAppCubit, StartAppState>(
      listener: (context, state) {
        if (state.status == StartAppStatus.noSessionIdSaved ||
            state.status == StartAppStatus.sessionIdExpired) {
          context.goNamed(AppRoute.signIn.name);
        } else if (state.status == StartAppStatus.sessionIdSaved) {
          context.goNamed(AppRoute.watchlist.name);
        }
      },
      child: const Center(
        child: MMHCircularProgressIndicator(),
      ),
    );
  }
}
