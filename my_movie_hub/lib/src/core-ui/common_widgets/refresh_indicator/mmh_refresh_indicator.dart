import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MMHRefreshIndicator extends StatelessWidget {
  const MMHRefreshIndicator({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.colors.onBackground,
      strokeWidth: 1,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
