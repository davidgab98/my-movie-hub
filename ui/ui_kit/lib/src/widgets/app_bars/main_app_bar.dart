import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    required this.title,
    this.leadingIconAction,
  });

  final String title;
  final VoidCallback? leadingIconAction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.secondary.withOpacity(0.6),
              AppColors.tertiary.withOpacity(0.6),
            ],
            stops: const [0.0, 0.75, 1.0],
          ),
        ),
        child: Container(
          color: AppColors.black.withOpacity(0.2),
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle.headlineXXL,
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
    );
  }
}
