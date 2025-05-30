import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_kit/ui_kit.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;

  const ShimmerPlaceholder({
    this.width,
    this.height,
    super.key,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.surfaceContainerHighest,
      highlightColor: Colors.grey[350]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.blueGrey[200],
          shape: shapeBorder,
        ),
      ),
    );
  }
}
