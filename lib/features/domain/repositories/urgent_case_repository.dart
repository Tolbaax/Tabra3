import 'package:dartz/dartz.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/features/data/models/urgent_case_model.dart';

abstract class UrgentCaseRepository {
  Future<Either<Failure, UrgentCaseModel>> GetAllUrgentCases();
}
