import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/models/usrgent_case_model.dart';

import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';

class BloodDroop extends StatelessWidget {
  final String text;

  const BloodDroop({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          ImageAssets.bloodDrop,
          height: context.height * 0.07,
          color: AppColors.primary,
        ),
        Positioned(
          bottom: context.height * 0.015,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 13.5),
          ),
        ),
      ],
    );
  }
}
