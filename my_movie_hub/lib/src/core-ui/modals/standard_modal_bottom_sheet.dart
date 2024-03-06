import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

void showStandardModalBottomSheet({
  required BuildContext context,
  required Widget content,
  String? title,
  bool isScrollControlled = false,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: isScrollControlled,
    elevation: 0,
    backgroundColor: AppColors.backgroundAPPDark,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppBorderRadius.br16),
        topRight: Radius.circular(AppBorderRadius.br16),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: [
            if (title != null)
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(left: 150, top: 8, right: 150),
                  child: Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppBorderRadius.br32,
                        ),
                      ),
                      color: AppColors.black2,
                    ),
                  ),
                ),
              ),
            if (title != null)
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppSpaces.s16,
                    bottom: AppSpaces.s16,
                  ),
                  child: Text(
                    title,
                    style: AppTextStyle.headlineSmall.copyWith(
                      color: AppColors.overlayDark,
                    ),
                  ),
                ),
              ),
            content,
          ],
        ),
      );
    },
  );
}
