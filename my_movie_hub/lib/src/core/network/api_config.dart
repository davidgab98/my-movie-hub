import 'package:dio/dio.dart';

class ApiConfig {
  ApiConfig();

  final Duration receiveTimeout = const Duration(milliseconds: 15000);
  final Duration connectionTimeout = const Duration(milliseconds: 15000);
  final ResponseType responseType = ResponseType.json;
  final Map<String, String> defaultContentType = {'accept': 'application/json'};

  /// the movie data base api-key
  final String apiKey = '4d84a7e441052a02eea20844a01b8d28';
}
