import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class OverallRatingStars extends StatelessWidget {
  const OverallRatingStars({
    required this.voteAverage,
    required this.voteCount,
    super.key,
  });

  final double voteAverage;
  final double voteCount;

  @override
  Widget build(BuildContext context) {
    // Convert value to 0-5 scale
    final double valueIn5 = (voteAverage / 2).clamp(0, 5);
    return Column(
      children: [
        Text(
          voteAverage.toStringAsFixed(1),
          style: AppTextStyle.titleMedium.copyWith(
            color: AppColors.overlayDark,
            backgroundColor: Colors.amber.withOpacity(0.2),
          ),
        ),
        AppSpaces.gapH4,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            // Calculate the filled of current star
            final double filled = (valueIn5 - index).clamp(0, 1);
            return Stack(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.grey.withOpacity(0.75),
                  size: 30,
                ),
                ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: filled,
                    child: const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        AppSpaces.gapH2,
        Text(
          '${voteCount.ceil()} reviews',
          style: AppTextStyle.labelSmall.copyWith(
            color: Colors.amber.withOpacity(0.75),
          ),
        ),
      ],
    );
  }
}
