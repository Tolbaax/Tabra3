import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../data/models/usrgent_case_model.dart';
import '../home/widgets/urgent_case_card.dart';
import 'widgets/blood_patient_appbar.dart';

class BloodPatientScreen extends StatelessWidget {
  const BloodPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const BloodPatientAppBar(),
        body: Padding(
          padding: EdgeInsets.all(context.toPadding * 0.45),
          child: AnimationLimiter(
            child: ListView.separated(
              itemCount: urgentCases.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return UrgentCaseCard(
                  model: urgentCases[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: context.height * 0.02,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
