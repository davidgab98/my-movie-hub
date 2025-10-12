import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';

class LanguageInterceptor extends Interceptor {
  LanguageInterceptor();

  String _systemLocaleTag() {
    return ui.PlatformDispatcher.instance.locale.toLanguageTag();
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.putIfAbsent(
      'language',
      () => locator<LocalStorageService>().getLanguage() ?? _systemLocaleTag(),
    );

    super.onRequest(options, handler);
  }
}
