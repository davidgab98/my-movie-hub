import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

extension ShowSnackBar on BuildContext {
  void showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    _showStatusSnackBar(
      context: context,
      message: message,
      icon: const Icon(
        Icons.check_circle,
        color: AppColors.green,
      ),
    );
  }

  void showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    _showStatusSnackBar(
      context: context,
      message: message,
      icon: Icon(
        Icons.error_rounded,
        color: colors.onError,
      ),
    );
  }

  void _showStatusSnackBar({
    required BuildContext context,
    required String message,
    required Icon icon,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 1,
          backgroundColor: context.colors.primary,
          padding: const EdgeInsets.all(AppSpaces.s16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br8),
          ),
          content: Row(
            children: [
              icon,
              AppSpaces.gapW8,
              Flexible(
                child: Text(
                  message,
                  style: AppTextStyle.titleSmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
