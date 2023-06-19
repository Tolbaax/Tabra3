import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/models/urgent_case_model.dart';
import '../repositories/urgent_case_repository.dart';

class UrgentCaseUsecase {
  final UrgentCaseRepository urgentCaseRepository;

  UrgentCaseUsecase(this.urgentCaseRepository);

  Future<Either<Failure, UrgentCaseModel>> getAllUrgentCases() async {
    return await urgentCaseRepository.GetAllUrgentCases();
  }
}
