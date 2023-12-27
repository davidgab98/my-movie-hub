import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:ui_kit/ui_kit.dart';

class MMHCircularProgressIndicatorStories {
  static Story all = Story(
      name: 'Loaders/MMHCircularProgressIndicator',
      description: '(Parametrizable circular progress indicator)',
      builder: (BuildContext context) => const Padding(
            padding: EdgeInsets.all(
              AppSpaces.s16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MMHCircularProgressIndicator(size: 20),
                SizedBox(height: 16),
                MMHCircularProgressIndicator(),
                SizedBox(height: 16),
                MMHCircularProgressIndicator(size: 50),
                SizedBox(height: 16),
                MMHCircularProgressIndicator(size: 75),
              ],
            ),
          ));
}
