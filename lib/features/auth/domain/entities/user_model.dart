import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String photoUrl;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [id, email, name, photoUrl];
}
