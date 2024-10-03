import 'package:quick_lingo/core/network/api_response.dart';
import 'package:quick_lingo/core/network/resquests/auth/sign_in_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quick_lingo/core/network/api_service.dart';
import 'package:quick_lingo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:quick_lingo/core/network/responses/auth/sign_in_response.dart';
import 'package:quick_lingo/core/common/result.dart';

import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUp(() {
    mockApiService = MockApiService();
    authRemoteDataSource = AuthRemoteDataSourceImpl(mockApiService);
  });

  group('AuthRemoteDataSourceImpl', () {
    const email = 'test@example.com';
    const password = 'password123';
    // const userModel = UserModel(
    //     id: '1',
    //     name: 'Test User',
    //     email: email,
    //     photoUrl: 'https://example.com/photo.jpg');
    final loginResponse = SignInResponse(
        uid: '1',
        token: 'token',
        name: 'Test User',
        email: email,
        photoUrl: 'https://example.com/photo.jpg');

    test('signIn returns Success when sign-in is successful', () async {
      when(mockApiService
              .signIn(SignInRequest(email: email, password: password)))
          .thenAnswer((_) async => ApiResponse(data: loginResponse));

      final result = await authRemoteDataSource.signIn(email, password);

      expect(result, loginResponse);
    });

    test('signIn throws Failure when sign-in fails', () async {
      when(mockApiService
              .signIn(SignInRequest(email: email, password: password)))
          .thenAnswer((_) async => ApiResponse(data: null, messages: 'Error'));

      expect(() => authRemoteDataSource.signIn(email, password),
          throwsA(isA<Failure>()));
    });

    test('signIn throws Failure on exception', () async {
      when(mockApiService
              .signIn(SignInRequest(email: email, password: password)))
          .thenThrow(Exception('Error'));

      expect(() => authRemoteDataSource.signIn(email, password),
          throwsA(isA<Failure>()));
    });
  });
}
