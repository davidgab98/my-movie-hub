import 'package:dio/dio.dart';

class LanguageInterceptor extends Interceptor {
  /// language = iso_639_1-iso_3166_1
  final String language;

  LanguageInterceptor({required this.language});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['language'] = language;
    super.onRequest(options, handler);
  }
}
