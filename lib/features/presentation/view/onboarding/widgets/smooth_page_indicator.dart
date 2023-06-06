import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../data/models/onboarding_model.dart';


class SmoothIndicator extends StatelessWidget {
  final int activeIndex;

  const SmoothIndicator({Key? key, required this.activeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: onBoardings.length,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: context.width * 0.08,
          height: context.height * 0.01,
          color: AppColors.primary,
          rotationAngle: 180,
          borderRadius: BorderRadius.circular(24),
        ),
        dotDecoration: DotDecoration(
          width: context.height * 0.01,
          height: context.height * 0.01,
          color: AppColors.hint.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          verticalOffset: 0,
        ),
        spacing: 6.0,
      ),
    );
  }
}
