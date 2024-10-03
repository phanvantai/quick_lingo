import 'package:quick_lingo/core/common/result.dart';
import 'package:quick_lingo/features/auth/domain/entities/user_model.dart';

abstract class AuthRepository {
  Future<Result<UserModel, Exception>> signIn(String email, String password);
}
