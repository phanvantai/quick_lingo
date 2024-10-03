import 'package:equatable/equatable.dart';

abstract class Request extends Equatable {
  Map<String, dynamic> toJson();
}
