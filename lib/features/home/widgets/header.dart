import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/app_colors.dart';

import '../../../core/utils/app_strings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.userHello,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Icon(
              Icons.notifications_active_outlined,
              color: AppColors.primary,
              size: 26.0,
            ),
          ],
        ),
        Text(
          AppStrings.bloodSearch,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
