import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie_hub/bootstrap.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await serviceLocatorSetUp();

  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('package:ui_kit/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  GoogleFonts.config.allowRuntimeFetching = false;

  await bootstrap(() => const App());
}
