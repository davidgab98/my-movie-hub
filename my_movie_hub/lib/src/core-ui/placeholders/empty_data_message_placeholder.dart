import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class EmptyDataMessagePlaceholder extends StatelessWidget {
  const EmptyDataMessagePlaceholder({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'list.emptyResultsText'.tr(),
        style: AppTextStyle.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
