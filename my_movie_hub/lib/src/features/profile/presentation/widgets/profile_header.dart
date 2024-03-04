import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:my_movie_hub/src/features/user/application/user_state.dart';
import 'package:ui_kit/ui_kit.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      bloc: locator<UserCubit>(),
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (state.user.avatar?.gravatarHash != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.gravatar.com/avatar/${state.user.avatar!.gravatarHash!}',
                ),
              ),
            if (state.user.avatar?.avatarImagePath != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://image.tmdb.org/t/p/original${state.user.avatar!.avatarImagePath!}',
                ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpaces.s32,
                vertical: AppSpaces.s16,
              ),
              child: Image(
                image: AssetImage(
                  'assets/pngs/user_profile_frame.png',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
