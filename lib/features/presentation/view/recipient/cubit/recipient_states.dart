import 'package:tabra3/features/data/models/donor_model.dart';

import '../../../../data/models/signup_response.dart';

abstract class RecipientStates {}

class RecipientInitialState extends RecipientStates {}

class GetAllRecipientLoading extends RecipientStates {}

class GetAllRecipientSuccess extends RecipientStates {
  final List<Donor> donor;

  GetAllRecipientSuccess({required this.donor});
}

class GetAllRecipientError extends RecipientStates {}



class AddRecipientLoading extends RecipientStates {}

class AddRecipientSuccess extends RecipientStates {
  final SignUpResponse response;

  AddRecipientSuccess({required this.response});
}

class AddRecipientError extends RecipientStates {}
