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
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.primary.withOpacity(0.1),
              AppColors.secondary.withOpacity(0.25),
              AppColors.primary.withOpacity(0.1),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
      title: title != null
          ? FittedBox(
              child: Text(
                title!,
                style: AppTextStyle.headlineXXL.copyWith(
                  color: AppColors.white,
                ),
              ),
            )
          : const Image(
              alignment: Alignment.center,
              height: kToolbarHeight - 22,
              image: AssetImage(
                'assets/pngs/mmh_logo.png',
              ),
            ),
      leading: leadingIconAction != null
          ? IconButton(
              padding: const EdgeInsets.only(left: AppSpaces.s12),
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 30,
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
