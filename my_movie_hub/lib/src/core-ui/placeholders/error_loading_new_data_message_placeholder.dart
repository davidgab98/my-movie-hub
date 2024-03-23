import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ErrorLoadingNewDataMessagePlaceholder extends StatelessWidget {
  const ErrorLoadingNewDataMessagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'list.errorLoadingNewDataText'.tr(),
        style: AppTextStyle.labelMedium.copyWith(
          color: context.colors.onBackground,
        ),
      ),
    );
  }
}
