import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class LogOutMenuOption extends StatelessWidget {
  const LogOutMenuOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppBorderRadius.br40,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.tertiary.withOpacity(0.1),
        ),
        child: const Icon(Icons.logout_rounded, color: AppColors.tertiary),
      ),
      title: Text(
        'Cerrar sesión',
        style: AppTextStyle.headlineSmall.copyWith(
          color: AppColors.red,
        ),
      ),
    );
  }
}
