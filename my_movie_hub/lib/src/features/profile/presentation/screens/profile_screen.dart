import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core-ui/styles/theme/theme_cubit.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/core/utils/locale_utils.dart';
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
      appBar: MainAppBar(title: 'profile.mainTitle'.tr()),
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
                      color: context.colors.onBackground,
                    ),
                  ),
                  Text(
                    '${'profile.userIdLabel'.tr()}: ${state.user.id}',
                    style: AppTextStyle.labelSmall.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  AppSpaces.gapH24,
                  const OpenProfileWebButton(),
                  AppSpaces.gapH40,
                  ProfileMenuOption(
                    title:
                        '${'theme.mainTitle'.tr()}: ${context.read<ThemeCubit>().state == ThemeMode.dark ? 'theme.darkThemeLabel'.tr() : 'theme.lightThemeLabel'.tr()}',
                    icon: Icons.brush_rounded,
                    onPress: () => context.pushNamed(AppRoute.changeTheme.name),
                  ),
                  AppSpaces.gapH32,
                  ProfileMenuOption(
                    title:
                        '${'language.mainTitle'.tr()}: ${context.locale.getTranslatedString()}',
                    icon: Icons.language_rounded,
                    onPress: () =>
                        context.pushNamed(AppRoute.changeLanguage.name),
                  ),
                  AppSpaces.gapH32,
                  ProfileMenuOption(
                    title: 'helpAndFeedback.mainTitle'.tr(),
                    icon: Icons.feedback_outlined,
                    onPress: () =>
                        context.pushNamed(AppRoute.helpAndFeedback.name),
                  ),
                  AppSpaces.gapH32,
                  ProfileMenuOption(
                    title: 'about.mainTitle'.tr(),
                    icon: Icons.info_outline_rounded,
                    onPress: () => context.pushNamed(AppRoute.about.name),
                  ),
                  AppSpaces.gapH32,
                  const LogOutMenuOption(),
                  AppSpaces.gapH32,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
