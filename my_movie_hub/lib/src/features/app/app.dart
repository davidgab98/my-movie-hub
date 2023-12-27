import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/routing/app_router.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: goRouter,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class _MaterialAppWithDevicePreview extends StatelessWidget {
  const _MaterialAppWithDevicePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: DevicePreview.locale(context),
        routerConfig: goRouter,
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          ),
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
