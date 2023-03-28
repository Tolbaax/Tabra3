import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/models/usrgent_case_model.dart';

import '../home/widgets/urgent_case_card.dart';

class BloodPatientScreen extends StatelessWidget {
  const BloodPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.bloodPatient),
          actions: [
            Icon(
              Icons.notifications_active_outlined,
              color: AppColors.primary,
            ),
            SizedBox(
              width: context.width * 0.02,
            ),
          ],
        ),
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
