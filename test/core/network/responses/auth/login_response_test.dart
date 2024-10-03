import 'package:quick_lingo/features/auth/data/models/sign_in_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quick_lingo/core/network/responses/auth/sign_in_response.dart';

void main() {
  group('LoginResponse', () {
    test('fromJson should return a valid model', () {
      final json = {
        'uid': '123',
        'token': 'token123',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'photoUrl': 'http://example.com/photo.jpg'
      };

      final loginResponse = SignInResponse.fromJson(json);

      expect(loginResponse.uid, '123');
      expect(loginResponse.token, 'token123');
      expect(loginResponse.name, 'John Doe');
      expect(loginResponse.email, 'john.doe@example.com');
      expect(loginResponse.photoUrl, 'http://example.com/photo.jpg');
    });

    test('toJson should return a valid map', () {
      final loginResponse = SignInResponse(
        uid: '123',
        token: 'token123',
        name: 'John Doe',
        email: 'john.doe@example.com',
        photoUrl: 'http://example.com/photo.jpg',
      );

      final json = loginResponse.toJson();

      expect(json['uid'], '123');
      expect(json['token'], 'token123');
      expect(json['name'], 'John Doe');
      expect(json['email'], 'john.doe@example.com');
      expect(json['photoUrl'], 'http://example.com/photo.jpg');
    });

    test('toEntity should return a valid UserModel', () {
      final loginResponse = SignInResponse(
        uid: '123',
        token: 'token123',
        name: 'John Doe',
        email: 'john.doe@example.com',
        photoUrl: 'http://example.com/photo.jpg',
      );

      final userModel = loginResponse.toEntity();

      expect(userModel.id, '123');
      expect(userModel.email, 'john.doe@example.com');
      expect(userModel.name, 'John Doe');
      expect(userModel.photoUrl, 'http://example.com/photo.jpg');
    });
  });
}
