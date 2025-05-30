import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ProfileMenuOption extends StatelessWidget {
  const ProfileMenuOption({
    required this.title,
    required this.icon,
    required this.onPress,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppBorderRadius.br40,
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.colors.secondary.withValues(alpha: 0.1),
        ),
        child: Icon(icon, color: context.colors.tertiary),
      ),
      title: Text(
        title,
        style: AppTextStyle.headlineSmall.copyWith(
          color: context.colors.onSurface,
        ),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.colors.secondary.withValues(alpha: 0.1),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: context.colors.tertiary,
        ),
      ),
    );
  }
}
