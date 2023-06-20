import 'package:dartz/dartz.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/data/models/donor_model.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

abstract class RecipientRepository {
  Future<Either<Failure, DonorModel>> getAllRecipient();

  Future<Either<Failure, SignUpResponse>> addRecipient(AddCaseParams params);
}
