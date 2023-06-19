import 'package:tabra3/features/data/models/urgent_case_model.dart';

import '../../../../data/models/signup_response.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetAllUrgentCaseLoading extends HomeStates {}

class GetAllUrgentCaseSuccess extends HomeStates {
  final List<UrgentCase> urgentCase;

  GetAllUrgentCaseSuccess({required this.urgentCase});
}

class GetAllUrgentCaseError extends HomeStates {}

class AddUrgentCaseLoading extends HomeStates {}

class AddUrgentCaseSuccess extends HomeStates {
  final SignUpResponse response;

  AddUrgentCaseSuccess({required this.response});
}

class AddUrgentCaseError extends HomeStates {}
