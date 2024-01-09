import 'package:dio/dio.dart';

class SessionIdInterceptor extends Interceptor {
  final String? sessionId;

  SessionIdInterceptor({required this.sessionId});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // const endpointsRequiringSessionId = <String>[
    //   /// endpoints que requieren session_id
    // ];

    // if (endpointsRequiringSessionId.contains(options.path)) {
    //   options.queryParameters['session_id'] = sessionId;
    // }

    options.queryParameters['session_id'] = sessionId;

    super.onRequest(options, handler);
  }
}
