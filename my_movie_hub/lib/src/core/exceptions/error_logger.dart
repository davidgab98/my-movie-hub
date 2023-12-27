import 'package:flutter/foundation.dart';

class ErrorLogger {
  void logError(Object error, {StackTrace? stackTrace}) {
    // TODO(david.gonzalez): Add a crash reporting tool
    debugPrint('$error, $stackTrace');
  }

  void logException(Object exception, {StackTrace? stackTrace}) {
    debugPrint('$exception, ${stackTrace ?? ''}');
  }
}
