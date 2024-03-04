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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            AppBorderRadius.br20,
          ),
          bottomRight: Radius.circular(
            AppBorderRadius.br20,
          ),
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
              ),
              onPressed: leadingIconAction,
            )
          : null,
    );
  }
}
