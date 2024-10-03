import 'package:quick_lingo/core/common/quick_lingo_config.dart';
import 'package:quick_lingo/core/network/api_service.dart';
import 'package:quick_lingo/core/routing/app_route.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preference_helper.dart'; // Import the library that defines 'Dio'

final getIt = GetIt.instance;

Future<void> initializeContainer() async {
  // router
  getIt.registerSingleton(AppRoute());

  // shared preferences
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  // Register the QuickLingo Config
  getIt.registerSingleton(QuickLingoConfig());

  // Register other dependencies
  getIt.registerFactory(() => Dio());
  getIt.registerFactory(
      () => ApiService(getIt(), baseUrl: getIt<QuickLingoConfig>().baseUrl));

  // Register services
  // Register repositories
  // Register use cases
  // Register controllers
  // Register view models
  // Register views
}
