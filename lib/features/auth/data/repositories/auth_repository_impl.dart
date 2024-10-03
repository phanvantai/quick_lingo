import 'package:quick_lingo/core/common/result.dart';
import 'package:quick_lingo/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:quick_lingo/features/auth/data/models/sign_in_model.dart';
import 'package:quick_lingo/features/auth/domain/entities/user_model.dart';
import 'package:quick_lingo/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Result<UserModel, Exception>> signIn(
      String email, String password) async {
    try {
      final result = await authRemoteDataSource.signIn(email, password);
      return Success(result.toEntity());
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
