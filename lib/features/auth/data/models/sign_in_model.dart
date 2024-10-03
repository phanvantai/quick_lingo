import 'package:quick_lingo/core/network/responses/auth/sign_in_response.dart';

import '../../domain/entities/user_model.dart';

extension SignInResponseX on SignInResponse {
  UserModel toEntity() {
    return UserModel(
      id: uid ?? '',
      email: email ?? '',
      name: name ?? '',
      photoUrl: photoUrl ?? '',
    );
  }
}
