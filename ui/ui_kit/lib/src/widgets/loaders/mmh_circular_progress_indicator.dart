import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/app_styles.dart';

class MMHCircularProgressIndicator extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;
  const MMHCircularProgressIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 1,
        color: color ?? AppColors.primary,
      ),
    );
  }
}
