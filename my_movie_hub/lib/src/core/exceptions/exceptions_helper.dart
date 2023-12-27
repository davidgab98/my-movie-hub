import 'package:my_movie_hub/src/core/exceptions/app_exception.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';

mixin class ExceptionsHelper {
  String getExceptionMessage(Object exception) {
    if (exception is NetworkException) {
      return exception.details.message;
    } else if (exception is BaseAppException) {
      return exception.details.message;
    } else {
      return exception.toString();
    }
  }
}
