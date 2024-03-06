import 'package:dio/dio.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';

class AccountIdInterceptor extends Interceptor {
  AccountIdInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const String accountPath = '/account/';
    final int? accountId = locator<LocalStorageService>().getAccountId();

    if (options.path.contains(accountPath)) {
      options.path = options.path.replaceFirst(
        accountPath,
        '/account/$accountId/',
      );
    }

    handler.next(options);
  }
}
