import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:ui_kit_storybook/widgets/loaders/mmh_circular_progress_indicator_stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Center(
        child: Storybook(
          stories: [
            MMHCircularProgressIndicatorStories.all,
          ],
        ),
      );
}
