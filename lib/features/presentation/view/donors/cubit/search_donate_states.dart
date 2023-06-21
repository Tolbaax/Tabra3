import 'package:tabra3/features/data/models/donor_model.dart';

abstract class SearchDonateStates {}

class SearchDonorInitialState extends SearchDonateStates {}

class GetDonorByAddressLoading extends SearchDonateStates {}

class GetDonorByAddressSuccess extends SearchDonateStates {
  final List<Donor> donor;

  GetDonorByAddressSuccess({required this.donor});
}

class GetDonorByAddressError extends SearchDonateStates {}
