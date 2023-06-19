import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/features/presentation/view/home/widgets/all_urgent_cases.dart';

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
        body: AllUrgentCases()
      ),
    );
  }
}
