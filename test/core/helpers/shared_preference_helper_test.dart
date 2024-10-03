import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quick_lingo/core/helpers/shared_preference_helper.dart';

import 'shared_preference_helper_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late SharedPreferenceHelper sharedPreferenceHelper;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    sharedPreferenceHelper = SharedPreferenceHelper(mockSharedPreferences);
  });

  group('SharedPreferenceHelper', () {
    test('getAuthToken returns correct value', () {
      when(mockSharedPreferences.getString(SharedPreferenceHelper.authToken))
          .thenReturn('test_token');

      expect(sharedPreferenceHelper.getAuthToken, 'test_token');
    });

    test('setAuthToken saves the token', () async {
      when(mockSharedPreferences.setString(
              SharedPreferenceHelper.authToken, 'test_token'))
          .thenAnswer((_) async => true);

      expect(await sharedPreferenceHelper.setAuthToken('test_token'), true);
      verify(mockSharedPreferences.setString(
              SharedPreferenceHelper.authToken, 'test_token'))
          .called(1);
    });

    test('getFirstRun returns correct value', () {
      when(mockSharedPreferences.getBool(SharedPreferenceHelper.firstRun))
          .thenReturn(false);

      expect(sharedPreferenceHelper.getFirstRun, false);
    });

    test('setFirstRun saves the first run state', () async {
      when(mockSharedPreferences.setBool(SharedPreferenceHelper.firstRun, true))
          .thenAnswer((_) async => true);

      expect(await sharedPreferenceHelper.setFirstRun(true), true);
      verify(mockSharedPreferences.setBool(
              SharedPreferenceHelper.firstRun, true))
          .called(1);
    });
  });
}
