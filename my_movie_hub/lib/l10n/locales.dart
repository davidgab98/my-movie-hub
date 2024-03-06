import 'package:flutter/widgets.dart';

/// Comands to generate translations:
/// dart run easy_localization:generate -S assets/l10n -O lib/l10n
/// dart run easy_localization:generate -S assets/l10n -O lib/l10n -o locale_keys.g.dart -f keys

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
  ];
}
