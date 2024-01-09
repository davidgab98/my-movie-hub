import 'package:dio/dio.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';

class ApiConfig {
  ApiConfig();

  final Duration receiveTimeout = const Duration(milliseconds: 15000);
  final Duration connectionTimeout = const Duration(milliseconds: 15000);
  final ResponseType responseType = ResponseType.json;
  final Map<String, String> defaultContentType = {'accept': 'application/json'};

  /// The-Movie-Data-Base ApiKey
  final String apiKey = '4d84a7e441052a02eea20844a01b8d28';

  final String? sessionId = locator<LocalStorageService>().getSessionId();
  final int? accountId = locator<LocalStorageService>().getAccountId();
  final String language = 'es-ES';
}
