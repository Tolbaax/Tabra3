
import '../../../../data/models/signup_response.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final SignUpResponse response;

  SignUpSuccessState({required this.response});
}

class SignUpErrorState extends SignUpStates {}
