import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_hub/src/core/constants/external_urls.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicyPrivacyAndTermsOfUse extends StatefulWidget {
  const PolicyPrivacyAndTermsOfUse({required this.text, super.key});

  final String text;

  @override
  State<PolicyPrivacyAndTermsOfUse> createState() =>
      _PolicyPrivacyAndTermsOfUseState();
}

class _PolicyPrivacyAndTermsOfUseState
    extends State<PolicyPrivacyAndTermsOfUse> {
  late final TapGestureRecognizer _privacyRecognizer;
  late final TapGestureRecognizer _termsRecognizer;

  @override
  void initState() {
    super.initState();
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        final url = Uri.parse(ExternalUrls.privacyPolicy);
        await launchUrl(url);
      };
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        final url = Uri.parse(ExternalUrls.termsOfUse);
        await launchUrl(url);
      };
  }

  @override
  void dispose() {
    _privacyRecognizer.dispose();
    _termsRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${widget.text} ',
        style: AppTextStyle.bodySmall,
        children: [
          TextSpan(
            text: 'policy.privacy'.tr(),
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.lightBlueAccent,
              decoration: TextDecoration.underline,
            ),
            recognizer: _privacyRecognizer,
          ),
          TextSpan(text: 'common.and'.tr()),
          TextSpan(
            text: 'policy.terms'.tr(),
            style: AppTextStyle.bodySmall.copyWith(
              color: Colors.lightBlueAccent,
              decoration: TextDecoration.underline,
            ),
            recognizer: _termsRecognizer,
          ),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
