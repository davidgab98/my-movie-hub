import 'package:flutter/material.dart';
import 'package:my_movie_hub/bootstrap.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await serviceLocatorSetUp();

  await bootstrap(() => const App());
}
