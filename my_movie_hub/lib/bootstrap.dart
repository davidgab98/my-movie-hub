import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_hub/l10n/locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await EasyLocalization.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await GetIt.I.isReady<SharedPreferences>().then((_) async {
    await runZonedGuarded(
      () async => runApp(
        EasyLocalization(
          path: 'assets/l10n',
          supportedLocales: L10n.all,
          startLocale: L10n.all[0], // overrides device language
          fallbackLocale: L10n.all[0],
          useFallbackTranslations: true,
          child: await builder(),
        ),
      ),
      (error, stackTrace) {
        log(
          error.toString(),
          stackTrace: stackTrace,
        );
      },
    );
  });
}
