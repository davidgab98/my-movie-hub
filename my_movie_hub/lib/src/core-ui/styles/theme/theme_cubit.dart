// theme_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit()
      : super(
          locator<LocalStorageService>().getIsDarkTheme() ?? true
              ? ThemeMode.dark
              : ThemeMode.light,
        );

  void toggleTheme({required bool isDarkMode}) {
    locator<LocalStorageService>().setIsDarkTheme(isDark: isDarkMode);

    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
