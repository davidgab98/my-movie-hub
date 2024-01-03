import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

extension ShowSnackBar on BuildContext {
  void showSuccessSnackBar({
    required String message,
  }) {
    _showStatusSnackBar(
      message: message,
      icon: const Icon(
        Icons.check_circle,
        color: AppColors.green,
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
  }) {
    _showStatusSnackBar(
      message: message,
      icon: const Icon(
        Icons.error_rounded,
        color: AppColors.red,
      ),
    );
  }

  void _showStatusSnackBar({
    required String message,
    required Icon icon,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 1,
          backgroundColor: AppColors.primary,
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
