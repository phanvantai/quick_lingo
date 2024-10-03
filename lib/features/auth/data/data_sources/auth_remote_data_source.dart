import 'package:quick_lingo/core/network/api_service.dart';
import 'package:quick_lingo/core/network/responses/auth/sign_in_response.dart';
import 'package:quick_lingo/core/network/resquests/auth/sign_in_request.dart';

import '../../../../core/common/result.dart';

abstract class AuthRemoteDataSource {
  Future<SignInResponse> signIn(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<SignInResponse> signIn(String email, String password) async {
    try {
      final result = await apiService
          .signIn(SignInRequest(email: email, password: password));
      if (result.data != null) {
        return result.data!;
      } else {
        throw Failure(Exception(result.messages ?? 'Failed to sign in'));
      }
    } on Exception catch (e) {
      throw Failure(e);
    }
  }
}
