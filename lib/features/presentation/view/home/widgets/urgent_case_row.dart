import 'package:flutter/material.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_strings.dart';

class UrgentCaseRow extends StatelessWidget {
  const UrgentCaseRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.urgentCases,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.urgentCases),
          child: Text(
            AppStrings.seeAll,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
