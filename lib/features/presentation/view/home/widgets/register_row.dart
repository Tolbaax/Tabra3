import 'package:flutter/material.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'custom_card.dart';

class RegisterRow extends StatelessWidget {
  const RegisterRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCard(
          onTab: () {
            Navigator.pushNamed(context, Routes.bloodPatient);
          },
          text: AppStrings.bloodSick,
          img: ImageAssets.img1,
        ),
        CustomCard(
          onTab: () {
            Navigator.pushNamed(context, Routes.registerUrgent);
          },
          text: AppStrings.registerUrgentCases,
          img: ImageAssets.img2,
        ),
        CustomCard(
          onTab: () {
            Navigator.pushNamed(context, Routes.newDonor);
          },
          text: AppStrings.newDonor,
          img: ImageAssets.img3,
        ),
      ],
    );
  }
}
