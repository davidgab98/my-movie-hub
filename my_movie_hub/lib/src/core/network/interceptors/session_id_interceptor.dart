import 'package:dio/dio.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';

class SessionIdInterceptor extends Interceptor {
  SessionIdInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // const endpointsRequiringSessionId = <String>[
    //   /// endpoints que requieren session_id
    // ];

    // if (endpointsRequiringSessionId.contains(options.path)) {
    //   options.queryParameters['session_id'] = sessionId;
    // }

    final sessionId = locator<LocalStorageService>().getSessionId();

    options.queryParameters['session_id'] = sessionId;

    super.onRequest(options, handler);
  }
}
