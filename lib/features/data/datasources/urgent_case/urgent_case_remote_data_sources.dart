import 'package:flutter/cupertino.dart';
import 'package:tabra3/core/api/api_consumer.dart';
import 'package:tabra3/core/api/end_points.dart';

import '../../models/urgent_case_model.dart';

abstract class UrgentCaseRemoteDataSource {
  Future<UrgentCaseModel> getAllUrgentCases();
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
}
