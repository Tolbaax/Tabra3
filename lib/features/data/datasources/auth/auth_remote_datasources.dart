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
      if (response != null) {
        return SignInResponse.fromJson(response);
      } else {
        throw Exception('Sign in failed.');
      }
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<SignUpResponse> signUp(SignUpParams params) async {
    try {
      final response =
          await apiConsumer.post(EndPoints.register, body: params.toJson());
      if (response != null) {
        return SignUpResponse.fromJson(response);
      } else {
        throw Exception('Sign up failed.');
      }
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {} catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
