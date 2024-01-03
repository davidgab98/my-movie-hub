import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_movie_hub/src/features/user/domain/model/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(User(id: -1, username: '')) User user,
  }) = _User;
}
