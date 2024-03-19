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
      elevation: 0,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withOpacity(0.3),
              AppColors.secondary.withOpacity(0.2),
              AppColors.tertiary.withOpacity(0.1),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
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
                color: AppColors.white,
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
