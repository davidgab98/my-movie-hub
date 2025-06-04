import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'about.mainTitle'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.s32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                height: MediaQuery.of(context).size.height * 0.09,
                image: const AssetImage(
                  'assets/png/mmh_logo.png',
                ),
              ),
            ),
            AppSpaces.gapH16,
            Text(
              'MY MOVIE HUB',
              style: AppTextStyle.headlineXLSmall,
            ),
            AppSpaces.gapH20,
            Text(
              'Version 1.0.0',
              style: AppTextStyle.titleSmall,
            ),
            AppSpaces.gapH32,
            const Divider(),
            const AttributionText(),
            AppSpaces.gapH8,
            Text(
              'This product uses the TMDB API but is not endorsed or certified by TMDB.',
              style: AppTextStyle.headlineSmall,
              textAlign: TextAlign.center,
            ),
            AppSpaces.gapH16,
            Image(
              height: MediaQuery.of(context).size.height * 0.09,
              image: const AssetImage(
                'assets/png/tmdb_logo.png',
              ),
            ),
            AppSpaces.gapH8,
            const Divider(),
            AppSpaces.gapH32,
            const OpenSourceLicensesButton(),
          ],
        ),
      ),
    );
  }
}

class AttributionText extends StatefulWidget {
  const AttributionText({super.key});

  @override
  State<AttributionText> createState() => _AttributionTextState();
}

class _AttributionTextState extends State<AttributionText> {
  late final TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()
      ..onTap = () async {
        final url = Uri.parse('https://www.themoviedb.org/');
        await launchUrl(url);
      };
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: AppTextStyle.bodySmall.copyWith(
          color: context.colors.onSurface,
        ),
        children: [
          const TextSpan(
            text:
                'All film-related metadata used in My Movie Hub, including actor, director and studio names, synopses, release dates and poster art is supplied by ',
          ),
          TextSpan(
            text: 'The Movie Database',
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: _recognizer,
          ),
          const TextSpan(
            text: ' (TMDB).',
          ),
        ],
      ),
    );
  }
}

class OpenSourceLicensesButton extends StatelessWidget {
  const OpenSourceLicensesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showLicensePage(
        context: context,
        applicationName: 'My Movie Hub',
        applicationVersion: '1.0.0',
        applicationLegalese: '© 2024 My Movie Hub.',
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpaces.s24,
          vertical: AppSpaces.s8,
        ),
        backgroundColor: AppColors.tertiary,
        shape: const StadiumBorder(),
      ),
      child: Text(
        'Open Source Licenses',
        style: AppTextStyle.headlineMedium.copyWith(
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
