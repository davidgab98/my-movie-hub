import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/core/exceptions/app_exception.dart';
import 'package:my_movie_hub/src/core/exceptions/network_exception.dart';
import 'package:my_movie_hub/src/core/network/endpoints.dart';
import 'package:my_movie_hub/src/core/network/network_service.dart';
import 'package:my_movie_hub/src/features/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:my_movie_hub/src/features/user/domain/model/user.dart';

class ApiSignInRepository extends SignInRepository {
  ApiSignInRepository({required this.networkService});
  final NetworkService networkService;

  @override
  Future<Result<String, Exception>> createAndValidateRequestToken({
    required String username,
    required String password,
  }) async {
    try {
      final createTokenResponse =
          await networkService.get(Endpoints.createRequestToken);
      final requestToken = createTokenResponse.data['request_token'] as String;

      final validateTokenResponse = await networkService.post(
        Endpoints.validateRequestToken,
        queryParameters: {
          'username': username,
          'password': password,
          'request_token': requestToken,
        },
        options: Options(
          validateStatus: (status) {
            return status != null && (status == 200 || status == 401);
          },
        ),
      );

      if (validateTokenResponse.statusCode == 401) {
        return Error(
          InvalidSignInCredentialsException(),
        );
      } else {
        return Success(requestToken);
      }
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<String, Exception>> createSession({
    required String requestToken,
  }) async {
    try {
      final response = await networkService.post(
        Endpoints.createSession,
        queryParameters: {
          'request_token': requestToken,
        },
      );

      final sessionId = response.data['session_id'] as String;

      return Success(sessionId);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }

  @override
  Future<Result<User, Exception>> getUserAccount({
    required String sessionId,
  }) async {
    try {
      final response = await networkService.get(
        Endpoints.getAccount,
      );

      final User user = User.fromJson(response.data as Map<String, dynamic>);

      return Success(user);
    } catch (e) {
      return Error(NetworkException.fromError(e));
    }
  }
}
