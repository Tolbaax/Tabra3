import 'package:dartz/dartz.dart';
import 'package:tabra3/core/error/failures.dart';
import 'package:tabra3/core/params/signin_params.dart';
import 'package:tabra3/core/params/signup_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signUp(SignUpParams params);

  Future<Either<Failure, void>> signIn(SignInParams params);

  Future<Either<Failure, void>> signout();
}
