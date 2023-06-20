import 'package:tabra3/features/data/models/donor_model.dart';
import 'package:tabra3/features/data/models/urgent_case_model.dart';

import '../../../../data/models/signup_response.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

// UrgentCase
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

// Donor
class GetAllDonorLoading extends HomeStates {}

class GetAllDonorSuccess extends HomeStates {
  final List<Donor> donor;

  GetAllDonorSuccess({required this.donor});
}

class GetAllDonorError extends HomeStates {}

class AddDonorLoading extends HomeStates {}

class AddDonorSuccess extends HomeStates {
  final SignUpResponse response;

  AddDonorSuccess({required this.response});
}

class AddDonorError extends HomeStates {}
