import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/user/application/user_cubit.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenProfileWebButton extends StatelessWidget {
  const OpenProfileWebButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        //TODO: Save url in const
        final uri = Uri.parse(
          'https://www.themoviedb.org/u/${locator<UserCubit>().state.user.username}',
        );
        await launchUrl(uri);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.s64,
          vertical: AppSpaces.s10,
        ),
        backgroundColor: AppColors.secondary,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'GO TO WEB',
            style: AppTextStyle.bodyLarge.copyWith(
              color: context.colors.onBackground,
            ),
          ),
          AppSpaces.gapW8,
          Icon(
            Icons.open_in_new_rounded,
            color: context.colors.onBackground,
            size: 18,
          )
        ],
      ),
    );
  }
}
