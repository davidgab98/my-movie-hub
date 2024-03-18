import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie_hub/src/core-ui/modals/standard_modal_bottom_sheet.dart';
import 'package:ui_kit/ui_kit.dart';

class ModalActionModel {
  final String title;
  final VoidCallback action;
  final Color? titleColor;

  ModalActionModel({
    required this.title,
    required this.action,
    this.titleColor,
  });
}

void showActionsModalBottomSheet({
  required BuildContext context,
  required List<ModalActionModel> modalActions,
  String? title,
}) {
  return showStandardModalBottomSheet(
    context: context,
    title: title,
    content: Column(
      children: [
        for (var i = 0; i < modalActions.length; i++)
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpaces.s24,
              vertical: AppSpaces.s8,
            ),
            title: Text(
              modalActions[i].title,
              style: AppTextStyle.titleLarge.copyWith(
                color:
                    modalActions[i].titleColor ?? context.colors.onBackground,
              ),
            ),
            onTap: () {
              context.pop();
              modalActions[i].action.call();
            },
          ),
      ],
    ),
  );
}
