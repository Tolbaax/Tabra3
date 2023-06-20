import 'package:flutter/cupertino.dart';
import 'package:tabra3/core/api/api_consumer.dart';
import 'package:tabra3/core/api/end_points.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../../../core/params/add_case_params.dart';
import '../../models/donor_model.dart';

abstract class DonorRemoteDataSource {
  Future<DonorModel> getAllDonors();

  Future<SignUpResponse> addDonor(AddCaseParams params);
}

class DonorRemoteDataSourceImpl implements DonorRemoteDataSource {
  final ApiConsumer apiConsumer;

  DonorRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<DonorModel> getAllDonors() async {
    try {
      final result = await apiConsumer.post(EndPoints.allDonors);

      if (result != null) {
        return DonorModel.fromJson(result);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return DonorModel(message: 'An error occurred', code: 500);
  }

  @override
  Future<SignUpResponse> addDonor(AddCaseParams params) async {
    try {
      final response = await apiConsumer.post(EndPoints.addDonor,
          body: params.toJson());

      if (response != null && response is Map<String, dynamic>) {
        return SignUpResponse.fromJson(response);
      }
    } catch (e) {
      print('Error during add Donor: $e');
    }

    return SignUpResponse(message: 'An error occurred', code: 500);
  }
}
