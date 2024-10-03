import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  final String? uid;
  final String? token;
  final String? name;
  final String? email;
  final String? photoUrl;

  SignInResponse({this.uid, this.token, this.name, this.email, this.photoUrl});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
