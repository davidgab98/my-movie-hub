import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MMHCircularProgressIndicator extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;
  const MMHCircularProgressIndicator({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 1,
        color: color ?? context.colors.onSurface,
      ),
    );
  }
}
