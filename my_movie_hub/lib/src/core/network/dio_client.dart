import 'package:dio/dio.dart';
import 'package:my_movie_hub/src/core/network/api_config.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/interceptors/account_id_interceptor.dart';
import 'package:my_movie_hub/src/core/network/interceptors/api_key_interceptor.dart';
import 'package:my_movie_hub/src/core/network/interceptors/language_interceptor.dart';
import 'package:my_movie_hub/src/core/network/interceptors/session_id_interceptor.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';

class DioClient extends NetworkService {
  DioClient(this._dio, {ApiConfig? apiConfig})
      : _apiConfig = apiConfig ?? ApiConfig() {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = _apiConfig.connectionTimeout
      ..options.receiveTimeout = _apiConfig.receiveTimeout
      ..options.responseType = _apiConfig.responseType
      ..options.headers.addAll(_apiConfig.defaultContentType)
      ..interceptors.add(ApiKeyInterceptor(apiKey: _apiConfig.apiKey))
      ..interceptors.add(SessionIdInterceptor(sessionId: _apiConfig.sessionId))
      ..interceptors.add(AccountIdInterceptor(accountId: _apiConfig.accountId))
      ..interceptors.add(LanguageInterceptor(language: _apiConfig.language));
  }

  final Dio _dio;
  final ApiConfig _apiConfig;

  @override
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
