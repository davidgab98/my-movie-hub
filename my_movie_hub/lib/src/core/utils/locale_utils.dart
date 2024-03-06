import 'dart:ui';

extension LocaleExtension on Locale {
  String getTranslatedString() {
    switch (languageCode) {
      case 'es':
        return 'Español';
      case 'en':
        return 'Inglés';
      default:
        return languageCode;
    }
  }
}
