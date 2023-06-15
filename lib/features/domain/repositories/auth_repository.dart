import 'package:dartz/dartz.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/signin_params.dart';
import 'package:tabra3/core/params/signup_params.dart';
import 'package:tabra3/features/data/models/signin_response.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpResponse>> signUp(SignUpParams params);

  Future<Either<Failure, SignInResponse>> signIn(SignInParams params);

  Future<Either<Failure, void>> signout();
}
