import 'package:bloc/bloc.dart';
import 'package:my_movie_hub/src/features/user/application/user_state.dart';
import 'package:my_movie_hub/src/features/user/domain/model/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  void updateUserWith(User user) {
    emit(
      state.copyWith(user: user),
    );
  }
}
