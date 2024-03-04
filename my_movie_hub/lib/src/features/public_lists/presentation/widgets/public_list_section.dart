import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class PublicListSection extends StatelessWidget {
  const PublicListSection({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
          child: Text(
            title,
            style:
                AppTextStyle.headlineXL.copyWith(color: AppColors.overlayDark),
          ),
        ),
        SizedBox(
          height: 200,
          child: child,
        ),
      ],
    );
  }
}
