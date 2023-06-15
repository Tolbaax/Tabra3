import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../data/models/usrgent_case_model.dart';
import '../widgets/urgent_case_card.dart';

class UrgentCasesList extends StatelessWidget {
  const UrgentCasesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(AppStrings.urgentCases),
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