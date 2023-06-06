import 'package:tabra3/core/api/api_consumer.dart';
import 'package:tabra3/core/api/end_points.dart';
import 'package:tabra3/core/params/signup_params.dart';

import '../../../../core/params/signin_params.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp(SignUpParams params);

  Future<void> signIn(SignInParams params);

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<void> signIn(SignInParams params) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(SignUpParams params) async =>
      await apiConsumer.post(EndPoints.register, body: params.toJson());
}
