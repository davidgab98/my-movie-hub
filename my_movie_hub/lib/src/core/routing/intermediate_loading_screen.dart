import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/mmh_circular_progress_indicator.dart';

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
