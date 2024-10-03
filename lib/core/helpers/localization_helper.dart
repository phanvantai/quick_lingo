import 'package:flutter/material.dart';

/// Helper class for localization
class LocalizationHelper {
  static const String path = 'assets/translations';

  static List<Locale> get supportedLocales =>
      QuickLingoLocale.values.map((e) => e.locale).toList();

  static Locale get defaultLocale => supportedLocales.first;
}

/// Enum for supported locales
enum QuickLingoLocale {
  en,
  vi,
}

extension QuickLingoLocaleExtension on QuickLingoLocale {
  Locale get locale {
    switch (this) {
      case QuickLingoLocale.en:
        return const Locale('en', 'US');
      case QuickLingoLocale.vi:
        return const Locale('vi', 'VN');
    }
  }
}
