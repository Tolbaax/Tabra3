import 'package:dartz/dartz.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/urgent_case_params.dart';
import 'package:tabra3/features/data/models/signup_response.dart';
import 'package:tabra3/features/data/models/urgent_case_model.dart';

abstract class UrgentCaseRepository {
  Future<Either<Failure, UrgentCaseModel>> GetAllUrgentCases();

  Future<Either<Failure, SignUpResponse>> addUrgentCase(UrgentCaseParams params);
}
