import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/app_colors.dart';
import 'package:ui_kit/src/styles/app_text_style.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

final ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.white,
    selectedLabelStyle: AppTextStyle.bodySmall,
    unselectedLabelStyle: AppTextStyle.bodySmall,
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.primary,
    shadowColor: Colors.black,
    elevation: 3,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    surface: AppColors.backgroundAPPLight,
    onSurface: AppColors.black,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.white,
    surfaceContainerHighest: AppColors.shimmerBaseColorLight,
    outline: AppColors.black2,
  ),
);

final ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.white,
    selectedLabelStyle: AppTextStyle.bodySmall,
    unselectedLabelStyle: AppTextStyle.bodySmall,
  ),
  appBarTheme: const AppBarTheme(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.primary,
    shadowColor: AppColors.black,
    elevation: 3,
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    surface: AppColors.backgroundAPPDark,
    onSurface: AppColors.overlayDark,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.black,
    surfaceContainerHighest: AppColors.shimmerBaseColorDark,
    outline: AppColors.black2,
  ),
);
