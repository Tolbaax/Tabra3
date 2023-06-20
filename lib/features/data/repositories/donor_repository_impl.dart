import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../domain/repositories/donor_repository.dart';
import '../datasources/donor/donor_remote_datasource.dart';
import '../models/donor_model.dart';

class DonorRepositoryImpl implements DonorRepository {
  final DonorRemoteDataSource remoteDataSource;

  DonorRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SignUpResponse>> addDonor(AddCaseParams params) async {
    try {
      final result = await remoteDataSource.addDonor(params);
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }

  @override
  Future<Either<Failure, DonorModel>> getAllDonors() async {
    try {
      final result = await remoteDataSource.getAllDonors();
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }

  @override
  Future<Either<Failure, DonorModel>> getDonorByAddress(String address) async {
    try {
      final result = await remoteDataSource.getDonorByAddress(address);
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }
}
