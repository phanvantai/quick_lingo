import 'package:quick_lingo/core/helpers/localization_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/helpers/injection_container.dart';
import 'features/app/quick_lingo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the .env file
  await dotenv.load(fileName: ".env");

  // Initialize EasyLocalization
  await EasyLocalization.ensureInitialized();

  // Initialize the container
  await initializeContainer();

  runApp(EasyLocalization(
    supportedLocales: LocalizationHelper.supportedLocales,
    path: LocalizationHelper.path,
    fallbackLocale: LocalizationHelper.defaultLocale,
    child: const QuickLingoApp(),
  ));
}
