import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tabra3/core/error/failures.dart';

import '../../domain/repositories/urgent_case_repository.dart';
import '../datasources/urgent_case/urgent_case_remote_data_sources.dart';
import '../models/urgent_case_model.dart';

class UrgentCaseRepositoryImpl implements UrgentCaseRepository {
  final UrgentCaseRemoteDataSource remoteDataSource;

  UrgentCaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UrgentCaseModel>> GetAllUrgentCases() async {
    try {
      final result = await remoteDataSource.getAllUrgentCases();
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }
}
