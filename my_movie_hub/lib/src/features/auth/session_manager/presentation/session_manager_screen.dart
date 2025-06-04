import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/events/event_bus.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/features/auth/session_manager/application/session_manager_cubit.dart';
import 'package:my_movie_hub/src/features/auth/session_manager/application/session_manager_state.dart';
import 'package:my_movie_hub/src/features/auth/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';

class SessionManagerScreen extends StatelessWidget {
  const SessionManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionManagerCubit>(
      create: (context) => SessionManagerCubit(
        signInRepository: locator<SignInRepository>(),
        userCubit: locator<UserCubit>(),
        localStorageService: locator<LocalStorageService>(),
        eventBus: locator<IEventBus>(),
      )..init(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionManagerCubit, SessionManagerState>(
      listener: (context, state) {
        if (state.status == SessionManagerStatus.noSessionIdSaved ||
            state.status == SessionManagerStatus.sessionIdExpired) {
          context.goNamed(AppRoute.signIn.name);
        } else if (state.status == SessionManagerStatus.sessionIdSaved) {
          context.goNamed(AppRoute.home.name);
        }
      },
      child: Center(
        child: Image(
          height: MediaQuery.of(context).size.height * 0.075,
          image: const AssetImage(
            'assets/png/mmh_logo.png',
          ),
        ),
      ),
    );
  }
}
