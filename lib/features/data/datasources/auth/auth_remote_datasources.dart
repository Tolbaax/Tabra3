import 'package:tabra3/core/api/api_consumer.dart';
import 'package:tabra3/core/api/end_points.dart';
import 'package:tabra3/core/params/signup_params.dart';
import 'package:tabra3/features/data/models/signin_response.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../../../core/params/signin_params.dart';

abstract class AuthRemoteDataSource {
  Future<SignUpResponse> signUp(SignUpParams params);

  Future<SignInResponse> signIn(SignInParams params);

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<SignInResponse> signIn(SignInParams params) async {
    try {
      final response =
          await apiConsumer.post(EndPoints.login, body: params.toJson());

      if (response != null && response is Map<String, dynamic>) {
        return SignInResponse.fromJson(response);
      }
    } catch (e) {
      print('Error during sign-up: $e');
    }

    return SignInResponse(message: 'An error occurred', code: 500);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<SignUpResponse> signUp(SignUpParams params) async {
    try {
      final response =
          await apiConsumer.post(EndPoints.register, body: params.toJson());

      if (response != null && response is Map<String, dynamic>) {
        return SignUpResponse.fromJson(response);
      }
    } catch (e) {
      print('Error during sign-up: $e');
    }

    return SignUpResponse(message: 'An error occurred', code: 500);
  }
}
