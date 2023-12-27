import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/core/exceptions/error_logger.dart';
import 'package:my_movie_hub/src/core/exceptions/exception_data.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException implements Exception {
  const NetworkException._();

  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.unauthorizedRequest() = UnauthorizedRequest;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.badCertificate() = BadCertificate;

  const factory NetworkException.connectionError() = ConnectionError;

  const factory NetworkException.notFound(String reason) = NotFound;

  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkException.notAcceptable() = NotAcceptable;

  const factory NetworkException.requestTimeout() = RequestTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.conflict() = Conflict;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.notImplemented() = NotImplemented;

  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(String error) = DefaultError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  factory NetworkException.fromError(dynamic error) {
    if (error is Exception) {
      NetworkException networkException;
      if (error is DioException) {
        ErrorLogger().logException(error, stackTrace: error.stackTrace);
        switch (error.type) {
          case DioExceptionType.cancel:
            networkException = const NetworkException.requestCancelled();
          case DioExceptionType.connectionTimeout:
            networkException = const NetworkException.requestTimeout();
          case DioExceptionType.receiveTimeout:
            networkException = const NetworkException.sendTimeout();
          case DioExceptionType.badCertificate:
            networkException = const NetworkException.badCertificate();
          case DioExceptionType.connectionError:
            networkException = const NetworkException.connectionError();
          case DioExceptionType.badResponse:
            switch (error.response?.statusCode) {
              case 400:
                networkException = const NetworkException.unauthorizedRequest();
              case 401:
                networkException = const NetworkException.unauthorizedRequest();
              case 403:
                networkException = const NetworkException.unauthorizedRequest();
              case 404:
                networkException = NetworkException.notFound(
                  error.response?.statusMessage ?? 'Oops, something went wrong',
                );
              case 409:
                networkException = const NetworkException.conflict();
              case 408:
                networkException = const NetworkException.requestTimeout();
              case 500:
                networkException = const NetworkException.internalServerError();
              case 503:
                networkException = const NetworkException.serviceUnavailable();
              default:
                final responseCode = error.response?.statusCode;
                networkException = NetworkException.defaultError(
                  'Received invalid status code: $responseCode',
                );
            }
          case DioExceptionType.sendTimeout:
            networkException = const NetworkException.sendTimeout();
          case DioExceptionType.unknown:
            if (error.message != null &&
                error.message!.contains('SocketException')) {
              networkException = const NetworkException.noInternetConnection();
              break;
            }
            networkException = const NetworkException.unexpectedError();
        }
      } else if (error is SocketException) {
        ErrorLogger().logException(error);
        networkException = const NetworkException.noInternetConnection();
      } else {
        ErrorLogger().logException(error);
        networkException = const NetworkException.unexpectedError();
      }

      return networkException;
    } else if (error is Error) {
      ErrorLogger().logError(error, stackTrace: error.stackTrace);
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkException.unableToProcess();
      } else {
        return const NetworkException.unexpectedError();
      }
    } else {
      debugPrint(error.toString());
      return const NetworkException.unexpectedError();
    }
  }
}

extension NetworkExceptionDetails on NetworkException {
  ExceptionData get details {
    return when(
      notImplemented: () => ExceptionData(
        'not-implemented',
        'error.notImplemented',
      ),
      requestCancelled: () => ExceptionData(
        'request-cancelled',
        'error.requestCancelled',
      ),
      internalServerError: () => ExceptionData(
        'internal-server-error',
        'error.requestCancelled',
      ),
      badCertificate: () => ExceptionData(
        'bad-certificate',
        'Bad Certificate',
      ),
      connectionError: () => ExceptionData(
        'connection-error',
        'Connection Error',
      ),
      notFound: (String reason) => ExceptionData(
        'not-found',
        reason,
      ),
      serviceUnavailable: () => ExceptionData(
        'service-unavailable',
        'error.serviceUnavailable',
      ),
      methodNotAllowed: () => ExceptionData(
        'method-not-allowed',
        'error.methodNotAllowed',
      ),
      badRequest: () => ExceptionData(
        'bad-request',
        'error.badRequest',
      ),
      unauthorizedRequest: () => ExceptionData(
        'unauthorized-request',
        'error.unauthorizedRequest',
      ),
      unexpectedError: () => ExceptionData(
        'unexpected-error-occurred',
        'error.unexpectedError',
      ),
      requestTimeout: () => ExceptionData(
        'connection-request-timeout',
        'error.requestTimeout',
      ),
      noInternetConnection: () => ExceptionData(
        'no-internet-connection',
        'error.noInternetConnection',
      ),
      conflict: () => ExceptionData(
        'error-due-to-a-conflict',
        'error.conflict',
      ),
      sendTimeout: () => ExceptionData(
        'send-timeout-in-connection-with-API-server',
        'error.sendTimeout',
      ),
      unableToProcess: () => ExceptionData(
        'unable-to-process-the-data',
        'error.unableToProcess',
      ),
      defaultError: (String error) => ExceptionData(
        'default-error',
        error,
      ),
      formatException: () => ExceptionData(
        'unexpected-error-occurred',
        'error.formatException',
      ),
      notAcceptable: () => ExceptionData(
        'not-acceptable',
        'error.notAcceptable',
      ),
    );
  }
}
