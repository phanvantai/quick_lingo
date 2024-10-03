import 'package:flutter_test/flutter_test.dart';
import 'package:quick_lingo/features/auth/domain/entities/user_model.dart';

void main() {
  group('UserModel', () {
    test('should be equal when properties are the same', () {
      const user1 = UserModel(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'https://example.com/photo.jpg',
      );
      const user2 = UserModel(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'https://example.com/photo.jpg',
      );

      expect(user1, equals(user2));
    });

    test('should not be equal when properties are different', () {
      const user1 = UserModel(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'https://example.com/photo.jpg',
      );
      const user2 = UserModel(
        id: '2',
        email: 'test2@example.com',
        name: 'Test User 2',
        photoUrl: 'https://example.com/photo2.jpg',
      );

      expect(user1, isNot(equals(user2)));
    });

    test('should have correct properties', () {
      const user = UserModel(
        id: '1',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'https://example.com/photo.jpg',
      );

      expect(user.id, '1');
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.photoUrl, 'https://example.com/photo.jpg');
    });
  });
}
