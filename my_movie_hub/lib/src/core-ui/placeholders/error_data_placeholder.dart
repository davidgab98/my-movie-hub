import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ErrorDataReloadPlaceholder extends StatelessWidget {
  const ErrorDataReloadPlaceholder({super.key, this.message, this.onReload});

  final String? message;
  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSpaces.gapH20,
          Text(
            message ?? 'error.placeholder.message'.tr(),
            style: AppTextStyle.bodySmall,
            textAlign: TextAlign.center,
          ),
          AppSpaces.gapH20,
          ElevatedButton(
            onPressed: onReload,
            child: Text(
              'error.placeholder.realoadButtonText'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
