import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String PhoneNumber;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.PhoneNumber,
  });

  Map<String, dynamic> toJson() => {
        'userName': name,
        'email': email,
        'password': password,
        'PhoneNumber': PhoneNumber,
      };

  @override
  List<Object?> get props => [name, email, password, PhoneNumber];
}
