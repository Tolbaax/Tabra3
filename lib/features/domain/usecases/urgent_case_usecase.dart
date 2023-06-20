import 'package:dartz/dartz.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../../core/error/failures.dart';
import '../../data/models/urgent_case_model.dart';
import '../repositories/urgent_case_repository.dart';

class UrgentCaseUsecase {
  final UrgentCaseRepository urgentCaseRepository;

  UrgentCaseUsecase(this.urgentCaseRepository);

  Future<Either<Failure, UrgentCaseModel>> getAllUrgentCases() async {
    return await urgentCaseRepository.GetAllUrgentCases();
  }

  Future<Either<Failure, SignUpResponse>> addUrgentCase(
      AddCaseParams params) async {
    return await urgentCaseRepository.addUrgentCase(params);
  }
}
