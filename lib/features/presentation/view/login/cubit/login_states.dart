import 'package:tabra3/features/data/models/signin_response.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final SignInResponse response;

  LoginSuccessState({required this.response});
}

class LoginErrorState extends LoginStates {}
