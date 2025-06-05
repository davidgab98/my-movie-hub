import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core-ui/modals/standard_modal.dart';
import 'package:ui_kit/ui_kit.dart';

Future<void> showInfoModal({
  required BuildContext context,
  required String content,
  VoidCallback? action,
  String? actionButtonText,
}) {
  return showStandardModal(
    context: context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          content,
          textAlign: TextAlign.center,
          style: AppTextStyle.titleMedium,
        ),
        AppSpaces.gapH16,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.br10),
            ),
            backgroundColor: context.colors.primary,
          ),
          onPressed: () {
            context.pop();
            action?.call();
          },
          child: Text(
            actionButtonText ?? 'common.ok'.tr(),
            style: AppTextStyle.titleMedium.copyWith(
              color: context.colors.onPrimary,
            ),
          ),
        ),
      ],
    ),
  );
}
