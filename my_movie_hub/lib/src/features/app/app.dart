import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:ui_kit/ui_kit.dart';

const useDevicePreview = false;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return useDevicePreview
        ? const _MaterialAppWithDevicePreview()
        : const _MaterialApp();
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: goRouter,
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.black2,
    selectedLabelStyle: AppTextStyle.bodySmall,
    unselectedLabelStyle: AppTextStyle.bodySmall,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
  ),
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: AppColors.backgroundAPPLight,
  ),
);

final ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.black2,
    selectedLabelStyle: AppTextStyle.bodySmall,
    unselectedLabelStyle: AppTextStyle.bodySmall,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1B2F),
    foregroundColor: Color(0xFFFFFFFF),
  ),
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: AppColors.backgroundAPPDark,
  ),
);

class _MaterialAppWithDevicePreview extends StatelessWidget {
  const _MaterialAppWithDevicePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DevicePreview(
        builder: (context) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: DevicePreview.locale(context),
          routerConfig: goRouter,
          builder: DevicePreview.appBuilder,
          darkTheme: darkTheme,
          theme: lightTheme,
        ),
      ),
    );
  }
}
