import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/params/signin_params.dart';
import '../../../core/params/signup_params.dart';
import '../repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<Either<Failure, void>> signUp(SignUpParams params) async {
    return await authRepository.signUp(params);
  }

  Future<Either<Failure, void>> signIn(SignInParams params) async {
    return await authRepository.signIn(params);
  }

  Future<Either<Failure, void>> signOut() async {
    return await authRepository.signout();
  }
}
