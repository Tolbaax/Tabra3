import 'package:flutter/cupertino.dart';
import 'package:tabra3/core/api/api_consumer.dart';
import 'package:tabra3/core/api/end_points.dart';
import 'package:tabra3/features/data/models/signup_response.dart';

import '../../../../core/params/add_case_params.dart';
import '../../models/donor_model.dart';

abstract class RecipientRemoteDataSource {
  Future<DonorModel> getAllRecipients();

  Future<SignUpResponse> addRecipient(AddCaseParams params);
}

class RecipientRemoteDataSourceImpl implements RecipientRemoteDataSource {
  final ApiConsumer apiConsumer;

  RecipientRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<DonorModel> getAllRecipients() async {
    try {
      final response = await apiConsumer.post(EndPoints.allRecipient);

      if (response != null && response is Map<String, dynamic>) {
        return DonorModel.fromJson(response);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return DonorModel(message: 'An error occurred', code: 500);
  }

  @override
  Future<SignUpResponse> addRecipient(AddCaseParams params) async {
    try {
      final response =
          await apiConsumer.post(EndPoints.addRecipient, body: params.toJson());

      if (response != null && response is Map<String, dynamic>) {
        return SignUpResponse.fromJson(response);
      }
    } catch (e) {
      print('Error during add Recipient: $e');
    }

    return SignUpResponse(message: 'An error occurred', code: 500);
  }
}
