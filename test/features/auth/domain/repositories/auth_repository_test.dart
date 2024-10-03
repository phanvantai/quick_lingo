import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quick_lingo/core/common/result.dart';
import 'package:quick_lingo/features/auth/domain/entities/user_model.dart';
import 'package:quick_lingo/features/auth/domain/repositories/auth_repository.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  group('AuthRepository', () {
    late MockAuthRepository mockAuthRepository;
    setUp(() {
      mockAuthRepository = MockAuthRepository();
    });

    test('signIn returns a UserModel on success', () async {
      const user = UserModel(
          id: '1',
          email: 'test@example.com',
          name: 'Test User',
          photoUrl: 'https://example.com/photo.jpg');
      provideDummy<Result<UserModel, Exception>>(const Success(user));
      when(mockAuthRepository.signIn('test@example.com', 'password'))
          .thenAnswer((_) async => const Success(user));

      final result =
          await mockAuthRepository.signIn('test@example.com', 'password');

      expect(result is Success, true);
      expect((result as Success).value, user);
    });

    test('signIn returns an Exception on failure', () async {
      final exception = Exception('Sign in failed');
      when(mockAuthRepository.signIn('test@example.com', 'wrongpassword'))
          .thenAnswer((_) async => Failure(exception));

      final result =
          await mockAuthRepository.signIn('test@example.com', 'wrongpassword');

      expect(result is Failure, true);
      expect((result as Failure).exception, exception);
    });
  });
}
