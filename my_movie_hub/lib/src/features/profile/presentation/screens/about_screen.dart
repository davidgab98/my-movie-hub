import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

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
                  'assets/pngs/mmh_logo.png',
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
            AppSpaces.gapH64,
            AppSpaces.gapH16,
            Text(
              'This product uses the TMDB API but is not endorsed or certified by TMDB.',
              style: AppTextStyle.headlineMedium,
              textAlign: TextAlign.center,
            ),
            AppSpaces.gapH48,
            const OpenSourceLicensesButton(),
          ],
        ),
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
