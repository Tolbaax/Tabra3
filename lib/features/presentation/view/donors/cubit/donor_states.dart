import 'package:tabra3/features/data/models/donor_model.dart';

import '../../../../data/models/signup_response.dart';

abstract class DonorStates {}

class DonorInitialState extends DonorStates {}

class GetAllDonorLoading extends DonorStates {}

class GetAllDonorSuccess extends DonorStates {
  final List<Donor> donor;

  GetAllDonorSuccess({required this.donor});
}

class GetAllDonorError extends DonorStates {}

class AddDonorLoading extends DonorStates {}

class AddDonorSuccess extends DonorStates {
  final SignUpResponse response;

  AddDonorSuccess({required this.response});
}

class AddDonorError extends DonorStates {}

class GetDonorByAddressLoading extends DonorStates {}

class GetDonorByAddressSuccess extends DonorStates {
  final List<Donor> donor;

  GetDonorByAddressSuccess({required this.donor});
}

class GetDonorByAddressError extends DonorStates {}
