import 'package:tabra3/features/data/models/urgent_case_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetAllUrgentCaseLoading extends HomeStates {}

class GetAllUrgentCaseSuccess extends HomeStates {
  final List<UrgentCase> urgentCase;

  GetAllUrgentCaseSuccess({required this.urgentCase});
}

class GetAllUrgentCaseError extends HomeStates {}
