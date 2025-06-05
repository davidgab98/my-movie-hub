import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_movie_hub/src/core-ui/theme/theme_cubit.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';
import 'package:my_movie_hub/src/core/utils/hot_restart_controller.dart';
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
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: HotRestartController(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  CountryLocalizations.delegate,
                  ...context.localizationDelegates,
                ],
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routerConfig: goRouter,
                darkTheme: darkTheme,
                theme: lightTheme,
                themeMode: context.select<ThemeCubit, ThemeMode>(
                  (themeCubit) => themeCubit.state,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MaterialAppWithDevicePreview extends StatelessWidget {
  const _MaterialAppWithDevicePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: HotRestartController(
            child: DevicePreview(
              builder: (context) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  CountryLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: context.supportedLocales,
                locale: DevicePreview.locale(context),
                routerConfig: goRouter,
                builder: DevicePreview.appBuilder,
                darkTheme: darkTheme,
                theme: lightTheme,
                themeMode: context.select<ThemeCubit, ThemeMode>(
                  (themeCubit) => themeCubit.state,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
