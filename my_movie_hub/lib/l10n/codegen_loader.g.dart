// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appTitle": "My Movie Hub EN",
  "homeTitle": "Inicio EN",
  "error": {
    "notImplemented": "Not Implemented",
    "requestCancelled": "Request Cancelled",
    "internalServerError": "Internal Server Error",
    "serviceUnavailable": "Service unavailable",
    "methodNotAllowed": "Method Not Allowed",
    "badRequest": "Bad Request",
    "unauthorizedRequest": "Unauthorized request",
    "unexpectedError": "Unexpected error occurred",
    "requestTimeout": "Connection request timeout",
    "noInternetConnection": "No internet connection",
    "conflict": "Error due to a conflict",
    "sendTimeout": "Send timeout in connection with API server",
    "unableToProcess": "Unable to process the data",
    "formatException": "Oops something went wrong",
    "notAcceptable": "Not acceptable",
    "custom": {
      "invalidSignInCredentialsException": "Email o PIN incorrectos",
      "exampleSpecificExceptionWithExtraParameter": "Example Specific Exception With Extra Parameter: {}"
    },
    "default": {
      "signIn": "Ha habido un problema iniciando sesión"
    }
  }
};
static const Map<String,dynamic> es = {
  "appTitle": "My Movie Hub ES",
  "homeTitle": "Inicio ES",
  "error": {
    "notImplemented": "Not Implemented",
    "requestCancelled": "Request Cancelled",
    "internalServerError": "Internal Server Error",
    "serviceUnavailable": "Service unavailable",
    "methodNotAllowed": "Method Not Allowed",
    "badRequest": "Bad Request",
    "unauthorizedRequest": "Unauthorized request",
    "unexpectedError": "Unexpected error occurred",
    "requestTimeout": "Connection request timeout",
    "noInternetConnection": "No internet connection",
    "conflict": "Error due to a conflict",
    "sendTimeout": "Send timeout in connection with API server",
    "unableToProcess": "Unable to process the data",
    "formatException": "Oops something went wrong",
    "notAcceptable": "Not acceptable",
    "custom": {
      "invalidSignInCredentialsException": "Email o PIN incorrectos",
      "exampleSpecificExceptionWithExtraParameter": "Example Specific Exception With Extra Parameter: {}"
    },
    "default": {
      "signIn": "Ha habido un problema iniciando sesión"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "es": es};
}
