import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ReloadButtonPlaceholder extends StatelessWidget {
  const ReloadButtonPlaceholder({
    super.key,
    this.onReload,
  });

  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onReload,
        child: Text(
          'error.placeholder.realoadButtonText'.tr(),
          style: AppTextStyle.bodyMedium.copyWith(
            color: context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}
