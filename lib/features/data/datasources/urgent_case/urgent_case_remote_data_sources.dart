import 'package:flutter/cupertino.dart';
import 'package:tabra3/core/api/api_consumer.dart';
import 'package:tabra3/core/api/end_points.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../../../core/params/urgent_case_params.dart';
import '../../models/urgent_case_model.dart';

abstract class UrgentCaseRemoteDataSource {
  Future<UrgentCaseModel> getAllUrgentCases();

  Future<SignUpResponse> addUrgentCase(UrgentCaseParams params);
}

class UrgentCaseRemoteDataSourceImpl implements UrgentCaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  UrgentCaseRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<UrgentCaseModel> getAllUrgentCases() async {
    try {
      final result = await apiConsumer.post(EndPoints.allUrgentCases);

      if (result != null) {
        return UrgentCaseModel.fromJson(result);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return UrgentCaseModel(message: 'An error occurred', code: 500);
  }

  @override
  Future<SignUpResponse> addUrgentCase(UrgentCaseParams params) async {
    try {
      final response = await apiConsumer.post(EndPoints.addUrgentCase,
          body: params.toJson());

      if (response != null && response is Map<String, dynamic>) {
        return SignUpResponse.fromJson(response);
      }
    } catch (e) {
      print('Error during add Urgent Case: $e');
    }

    return SignUpResponse(message: 'An error occurred', code: 500);
  }
}
