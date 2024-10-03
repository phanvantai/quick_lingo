import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:quick_lingo/core/helpers/localization_helper.dart';

void main() {
  group('LocalizationHelper', () {
    test('supportedLocales returns correct list of locales', () {
      final supportedLocales = LocalizationHelper.supportedLocales;
      expect(supportedLocales, [
        const Locale('en', 'US'),
        const Locale('vi', 'VN'),
      ]);
    });

    test('defaultLocale returns the first locale in supportedLocales', () {
      final defaultLocale = LocalizationHelper.defaultLocale;
      expect(defaultLocale, const Locale('en', 'US'));
    });
  });

  group('QuickLingoLocaleExtension', () {
    test('locale returns correct Locale for en', () {
      final locale = QuickLingoLocale.en.locale;
      expect(locale, const Locale('en', 'US'));
    });

    test('locale returns correct Locale for vi', () {
      final locale = QuickLingoLocale.vi.locale;
      expect(locale, const Locale('vi', 'VN'));
    });
  });
}
