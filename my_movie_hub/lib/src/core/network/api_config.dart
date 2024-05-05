import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  ApiConfig();

  final Duration receiveTimeout = const Duration(milliseconds: 15000);
  final Duration connectionTimeout = const Duration(milliseconds: 15000);
  final ResponseType responseType = ResponseType.json;
  final Map<String, String> defaultContentType = {'accept': 'application/json'};

  /// the movie data base api-key
  final String apiKey = dotenv.env['API_KEY']!;
}
