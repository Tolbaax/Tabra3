import 'package:dartz/dartz.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/data/models/donor_model.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../../core/error/failures.dart';
import '../repositories/recipient_repository.dart';

class RecipientUseCase {
  final RecipientRepository donorRepository;

  RecipientUseCase(this.donorRepository);

  Future<Either<Failure, DonorModel>> getAllRecipients() async {
    return await donorRepository.getAllRecipient();
  }

  Future<Either<Failure, SignUpResponse>> addRecipient(
      AddCaseParams params) async {
    return await donorRepository.addRecipient(params);
  }
}
