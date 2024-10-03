import 'package:flutter_test/flutter_test.dart';
import 'package:quick_lingo/core/network/resquests/auth/sign_in_request.dart';

void main() {
  group('SignInRequest', () {
    late SignInRequest signInRequest;

    setUp(() {
      signInRequest =
          SignInRequest(email: 'test@example.com', password: 'password123');
    });

    test('props returns correct values', () {
      expect(signInRequest.props, ['test@example.com', 'password123']);
    });

    test('toJson returns correct map', () {
      final expectedMap = {
        'email': 'test@example.com',
        'password': 'password123',
      };
      expect(signInRequest.toJson(), expectedMap);
    });
  });
}
