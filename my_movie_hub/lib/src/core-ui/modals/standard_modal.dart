import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_kit/ui_kit.dart';

Future<void> showStandardModal({
  required BuildContext context,
  required Widget child,
  bool showCloseButton = true,
  bool barrierDismissible = true,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) {
      return Dialog(
        insetPadding: const EdgeInsets.all(AppSpaces.s32),
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.br20),
          side: BorderSide(
            color: context.colors.outline.withValues(alpha: 0.25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpaces.s10,
            0,
            AppSpaces.s10,
            AppSpaces.s16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showCloseButton)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: context.colors.onSurface),
                    onPressed: context.pop,
                  ),
                ),
              child,
            ],
          ),
        ),
      );
    },
  );
}
