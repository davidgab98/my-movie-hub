import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class MetallicIconButton extends StatelessWidget {
  final IconData? icon;
  final Color baseColor;
  final VoidCallback? onPressed;
  final double size;

  const MetallicIconButton({
    this.icon,
    required this.baseColor,
    this.onPressed,
    this.size = 26.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lighter = baseColor.withOpacity(0.5);
    final darker = baseColor.withAlpha(150);

    return Container(
      decoration: BoxDecoration(
        color: context.colors.onBackground.withOpacity(0.15),
        borderRadius: BorderRadius.circular(
          AppBorderRadius.brMax,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.background.withOpacity(0.65),
          borderRadius: BorderRadius.circular(
            AppBorderRadius.brMax,
          ),
        ),
        child: icon != null
            ? IconButton(
                onPressed: onPressed,
                icon: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        lighter,
                        baseColor,
                        darker,
                        baseColor,
                        lighter,
                      ],
                      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: Icon(
                    icon,
                    size: size,
                    color: Colors.white,
                  ),
                ),
              )
            : IconButton(
                onPressed: () {},
                icon: Center(
                  child: SizedBox(
                    width: 20,
                    child: LinearProgressIndicator(
                      color: baseColor,
                      minHeight: 4,
                      backgroundColor: context.colors.background,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
