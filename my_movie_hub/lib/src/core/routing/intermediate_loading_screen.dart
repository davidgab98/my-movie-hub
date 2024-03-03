import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class IntermediateLoadingScreen extends StatelessWidget {
  const IntermediateLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MMHCircularProgressIndicator(),
      ),
    );
  }
}
