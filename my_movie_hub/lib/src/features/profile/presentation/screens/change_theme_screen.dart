import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core-ui/styles/theme/theme_cubit.dart';
import 'package:ui_kit/ui_kit.dart';

class ChangeThemeScreen extends StatelessWidget {
  const ChangeThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'theme.mainTitle'.tr()),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.s16),
        child: ListView(
          shrinkWrap: true,
          children: [
            for (int i = 1; i < ThemeMode.values.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpaces.s10),
                child: ListTile(
                  title: Text(
                    ThemeMode.values[i] == ThemeMode.dark
                        ? 'theme.darkThemeLabel'.tr()
                        : 'theme.lightThemeLabel'.tr(),
                    style: AppTextStyle.headlineMedium.copyWith(
                      color: context.colors.onSurface,
                    ),
                  ),
                  leading: Radio<ThemeMode>(
                    activeColor: context.colors.tertiary,
                    value: ThemeMode.values[i],
                    groupValue: context.read<ThemeCubit>().state,
                    onChanged: (ThemeMode? value) {
                      context
                          .read<ThemeCubit>()
                          .toggleTheme(isDarkMode: value == ThemeMode.dark);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
