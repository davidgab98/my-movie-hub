import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/profile/presentation/widgets/logout_menu_option.dart';
import 'package:my_movie_hub/src/features/profile/presentation/widgets/open_profile_web_button.dart';
import 'package:my_movie_hub/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:my_movie_hub/src/features/profile/presentation/widgets/profile_menu_option.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:my_movie_hub/src/features/user/application/user_state.dart';
import 'package:ui_kit/ui_kit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Mi perfil'),
      body: BlocBuilder<UserCubit, UserState>(
        bloc: locator<UserCubit>(),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const ProfileHeader(),
                  Text(
                    state.user.username,
                    style: AppTextStyle.headlineXXL.copyWith(
                      color: AppColors.overlayDark,
                    ),
                  ),
                  Text(
                    'user id: ${state.user.id}',
                    style: AppTextStyle.labelSmall.copyWith(
                      color: AppColors.overlayDark,
                    ),
                  ),
                  AppSpaces.gapH24,
                  const OpenProfileWebButton(),
                  AppSpaces.gapH40,
                  ProfileMenuOption(
                    title: 'Tema: Oscuro',
                    icon: Icons.brush_rounded,
                    onPress: () {},
                  ),
                  AppSpaces.gapH32,
                  ProfileMenuOption(
                    title: 'Idioma: Español',
                    icon: Icons.language_rounded,
                    onPress: () {},
                  ),
                  AppSpaces.gapH32,
                  const LogOutMenuOption(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
