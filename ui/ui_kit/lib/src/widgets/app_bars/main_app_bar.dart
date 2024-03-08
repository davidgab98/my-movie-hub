import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.leadingIconAction,
  });

  final String? title;
  final VoidCallback? leadingIconAction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      backgroundColor: AppColors.backgroundAPPDark,
      flexibleSpace: Container(color: AppColors.black.withOpacity(0.6)),
      centerTitle: true,
      title: title != null
          ? Text(
              title!,
              style: AppTextStyle.headlineXXL.copyWith(
                color: AppColors.white,
              ),
            )
          : const Image(
              alignment: Alignment.center,
              height: kToolbarHeight - 18,
              image: AssetImage(
                'assets/pngs/mmh_logo.png',
              ),
            ),
      leading: leadingIconAction != null
          ? IconButton(
              padding: const EdgeInsets.only(left: AppSpaces.s12),
              icon: const Icon(
                Icons.person,
                size: 28,
                color: AppColors.overlayDark,
              ),
              onPressed: leadingIconAction,
            )
          : null,
      actions: [
        if (title != null)
          const Padding(
            padding: EdgeInsets.only(right: AppSpaces.s16),
            child: Image(
              alignment: Alignment.center,
              height: kToolbarHeight - 28,
              image: AssetImage(
                'assets/pngs/mmh_logo.png',
              ),
            ),
          )
      ],
    );
  }
}
