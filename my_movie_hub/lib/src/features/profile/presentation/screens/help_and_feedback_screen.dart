import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core-ui/common_widgets/main_app_bar.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'helpAndFeedback.mainTitle'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.gapH16,
            _OptionListTile(
              title: 'helpAndFeedback.contact.mainTitle'.tr(),
              icon: Icons.coffee,
              onPress: () async {
                final email = Uri.encodeComponent('davidgab08@gmail.com');
                final subject = Uri.encodeComponent(
                  'helpAndFeedback.contact.mailSubject'.tr(),
                );
                final body = Uri.encodeComponent(
                  'helpAndFeedback.contact.mailBody'.tr(),
                );
                final mail =
                    Uri.parse('mailto:$email?subject=$subject&body=$body');
                await launchUrl(mail);
              },
            ),
            AppSpaces.gapH20,
            _OptionListTile(
              title: 'helpAndFeedback.feedback.mainTitle'.tr(),
              icon: Icons.bug_report_rounded,
              onPress: () async {
                final email = Uri.encodeComponent('davidgab08@gmail.com');
                final subject = Uri.encodeComponent(
                  'helpAndFeedback.feedback.mailSubject'.tr(),
                );
                final body = Uri.encodeComponent(
                  'helpAndFeedback.feedback.mailBody'.tr(),
                );
                final mail =
                    Uri.parse('mailto:$email?subject=$subject&body=$body');
                await launchUrl(mail);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionListTile extends StatelessWidget {
  const _OptionListTile({
    required this.title,
    required this.icon,
    required this.onPress,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(
        title,
        style: AppTextStyle.headlineSmall.copyWith(
          color: context.colors.onSurface,
        ),
      ),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.colors.secondary.withValues(alpha: 0.1),
        ),
        child: Icon(icon, color: context.colors.secondary),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: context.colors.secondary.withValues(alpha: 0.1),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: context.colors.secondary,
        ),
      ),
    );
  }
}
