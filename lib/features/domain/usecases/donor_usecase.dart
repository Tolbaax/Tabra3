import 'package:dartz/dartz.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/data/models/donor_model.dart';
import 'package:tabra3/features/data/models/signup_response.dart';
import 'package:tabra3/features/domain/repositories/donor_repository.dart';

import '../../../core/error/failures.dart';

class DonorUseCase {
  final DonorRepository donorRepository;

  DonorUseCase(this.donorRepository);

  Future<Either<Failure, DonorModel>> getAllDonors() async {
    return await donorRepository.getAllDonors();
  }

  Future<Either<Failure, SignUpResponse>> addDonor(AddCaseParams params) async {
    return await donorRepository.addDonor(params);
  }
}
