import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/signin_params.dart';
import 'package:tabra3/core/params/signup_params.dart';
import 'package:tabra3/features/data/datasources/auth/auth_remote_datasources.dart';
import 'package:tabra3/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, void>> signIn(SignInParams params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpParams params) async {
    try {
      final result = await authRemoteDataSource.signUp(params);
      return Right(result);
    } on DioError catch (error) {
      return Left(ServerFailure(error.message!));
    }
  }

  @override
  Future<Either<Failure, void>> signout() {
    throw UnimplementedError();
  }
}
