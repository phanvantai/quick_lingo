import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // key
  static const String authToken = "auth_token";
  static const String firstRun = "first_run";

  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // token
  String get getAuthToken {
    return _sharedPreference.getString(SharedPreferenceHelper.authToken) ?? '';
  }

  Future<bool> setAuthToken(String authToken) {
    return _sharedPreference.setString(
        SharedPreferenceHelper.authToken, authToken);
  }

  // first run state
  bool get getFirstRun {
    return _sharedPreference.getBool(SharedPreferenceHelper.firstRun) ?? true;
  }

  Future<bool> setFirstRun(bool firstRun) {
    return _sharedPreference.setBool(SharedPreferenceHelper.firstRun, firstRun);
  }
}
