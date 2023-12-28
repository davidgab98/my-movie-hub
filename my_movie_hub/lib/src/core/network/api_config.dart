import 'package:dio/dio.dart';

class ApiConfig {
  ApiConfig();

  final Duration receiveTimeout = const Duration(milliseconds: 15000);
  final Duration connectionTimeout = const Duration(milliseconds: 15000);
  final ResponseType responseType = ResponseType.json;

  // TheMovieDataBase API Read Access Token
  final apiReadAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZDg0YTdlNDQxMDUyYTAyZWVhMjA4NDRhMDFiOGQyOCIsInN1YiI6IjY1ODBjYzZlODc1ZDFhMDdhYWFlYmUwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Hiu0dmXNK7ojkwN-ZMRvp6QbpZxUGI0qKIHuwSY4tpE';

  Map<String, String> get headers {
    return {
      'accept': 'application/json',
      'Authorization': 'Bearer $apiReadAccessToken',
    };
  }
}
