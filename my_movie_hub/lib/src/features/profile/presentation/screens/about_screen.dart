import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/main_app_bar.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/policy_privacy_and_terms_of_use.dart';
import 'package:my_movie_hub/src/core/constants/external_urls.dart';
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
            AppSpaces.gapH10,
            Text(
              'Version 1.0.0',
              style: AppTextStyle.titleSmall,
            ),
            AppSpaces.gapH20,
            const Divider(),
            const AttributionText(),
            AppSpaces.gapH8,
            Text(
              'This product uses the TMDB API but is not endorsed or certified by TMDB.',
              style: AppTextStyle.titleMedium,
              textAlign: TextAlign.center,
            ),
            AppSpaces.gapH16,
            Image(
              height: MediaQuery.of(context).size.height * 0.09,
              image: const AssetImage(
                'assets/png/tmdb_logo.png',
              ),
            ),
            AppSpaces.gapH20,
            const Divider(),
            AppSpaces.gapH16,
            const OpenSourceLicensesButton(),
            AppSpaces.gapH16,
            const Divider(),
            AppSpaces.gapH16,
            const PolicyPrivacyAndTermsOfUse(text: 'Please read our'),
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
        final url = Uri.parse(ExternalUrls.tmdbUrl);
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
          TextSpan(
            text: 'about.attributionText'.tr(),
          ),
          TextSpan(
            text: 'The Movie Database',
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.lightBlueAccent,
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
        'about.openSourceLicenses'.tr(),
        style: AppTextStyle.headlineMedium.copyWith(
          color: context.colors.onSurface,
        ),
      ),
    );
  }
}
