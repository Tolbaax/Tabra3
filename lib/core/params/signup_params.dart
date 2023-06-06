import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParams(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() =>
      {'userName': name, 'email': email, 'password': password};

  @override
  List<Object?> get props => [name, email, password];
}
