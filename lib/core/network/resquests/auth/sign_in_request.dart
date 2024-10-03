import 'package:quick_lingo/core/network/resquests/request.dart';

class SignInRequest extends Request {
  final String email;
  final String password;

  SignInRequest({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
