import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';

class LanguageInterceptor extends Interceptor {
  LanguageInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final currentLanguage = locator<LocalStorageService>().getLanguage() ??
        Platform.localeName.replaceAll('_', '-');

    options.queryParameters['language'] = currentLanguage;

    super.onRequest(options, handler);
  }
}
