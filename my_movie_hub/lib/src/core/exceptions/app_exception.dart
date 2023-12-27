import 'package:my_movie_hub/src/core/exceptions/error_logger.dart';
import 'package:my_movie_hub/src/core/exceptions/exception_data.dart';

class BaseAppException implements Exception {
  BaseAppException(this._data) {
    ErrorLogger().logException(this);
  }

  final ExceptionData _data;

  ExceptionData get details => _data;

  @override
  String toString() {
    return '${super.toString()} - $_data';
  }
}

class ExampleSpecificExceptionWithExtraParameter extends BaseAppException {
  ExampleSpecificExceptionWithExtraParameter({
    required this.parameter,
  }) : super(
          ExceptionData(
            'examples-specific-exception-with-extra-parameter',
            'Example Specific Exception with extra parameter: $parameter',
          ),
        );

  final String parameter;
}
