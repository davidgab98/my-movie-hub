import 'package:multiple_result/multiple_result.dart';
import 'package:my_movie_hub/src/features/user/domain/model/user.dart';

// ignore: one_member_abstracts
abstract class SignInRepository {
  Future<Result<String, Exception>> createAndValidateRequestToken({
    required String username,
    required String password,
  });

  Future<Result<String, Exception>> createSession({
    required String requestToken,
  });

  Future<Result<User, Exception>> getUserAccount({
    required String sessionId,
  });
}
