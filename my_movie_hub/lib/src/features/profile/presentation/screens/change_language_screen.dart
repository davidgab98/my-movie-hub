import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/l10n/locales.dart';
import 'package:my_movie_hub/src/core/di/service_locator.dart';
import 'package:my_movie_hub/src/core/storage/local_storage.dart';
import 'package:my_movie_hub/src/core/utils/hot_restart_controller.dart';
import 'package:my_movie_hub/src/core/utils/locale_utils.dart';
import 'package:ui_kit/ui_kit.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'language.mainTitle'.tr()),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.s16),
        child: ListView(
          shrinkWrap: true,
          children: [
            for (int i = 0; i < L10n.all.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpaces.s10),
                child: ListTile(
                  title: Text(
                    L10n.all[i].getTranslatedString(),
                    style: AppTextStyle.headlineMedium.copyWith(
                      color: context.colors.onBackground,
                    ),
                  ),
                  leading: Radio<Locale>(
                    activeColor: context.colors.tertiary,
                    value: L10n.all[i],
                    groupValue: context.locale,
                    onChanged: (Locale? value) {
                      locator<LocalStorageService>().setLanguage(
                        value!.languageCode,
                      );

                      /// change language
                      context.setLocale(value);
                      HotRestartController.performHotRestart(context);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
