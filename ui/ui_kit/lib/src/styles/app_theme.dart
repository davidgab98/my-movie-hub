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
    background: AppColors.backgroundAPPLight,
    onBackground: AppColors.black,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.white,
    surface: AppColors.backgroundInputLight,
    onSurface: AppColors.black,
    surfaceVariant: AppColors.shimmerBaseColorLight,
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
    background: AppColors.backgroundAPPDark,
    onBackground: AppColors.overlayDark,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.black,
    surface: AppColors.backgroundInputDark,
    onSurface: AppColors.overlayDark,
    surfaceVariant: AppColors.shimmerBaseColorDark,
    outline: AppColors.black2,
  ),
);
