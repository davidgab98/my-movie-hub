import 'package:dio/dio.dart';

class AccountIdInterceptor extends Interceptor {
  final int? accountId;

  AccountIdInterceptor({required this.accountId});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const String accountPath = '/account/';

    if (options.path.contains(accountPath)) {
      options.path = options.path.replaceFirst(
        accountPath,
        '/account/$accountId/',
      );
    }

    handler.next(options);
  }
}
