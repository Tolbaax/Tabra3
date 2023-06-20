import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../domain/repositories/recipient_repository.dart';
import '../datasources/recipient/recipient_remote_datasource.dart';
import '../models/donor_model.dart';

class RecipientRepositoryImpl implements RecipientRepository {
  final RecipientRemoteDataSource remoteDataSource;

  RecipientRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SignUpResponse>> addRecipient(
      AddCaseParams params) async {
    try {
      final result = await remoteDataSource.addRecipient(params);
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }

  @override
  Future<Either<Failure, DonorModel>> getAllRecipient() async {
    try {
      final result = await remoteDataSource.getAllRecipients();
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }
}
