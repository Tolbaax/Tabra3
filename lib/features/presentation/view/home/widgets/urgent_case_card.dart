import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tabra3/core/utils/assets_manager.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/features/presentation/components/blood_drop.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../data/models/urgent_case_model.dart';
import 'segmented_button.dart';

class UrgentCaseCard extends StatelessWidget {
  final UrgentCase model;
  final int index;

  const UrgentCaseCard({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int selectedIndex = 0;

    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 800),
      child: SlideAnimation(
        verticalOffset: 100.0,
        child: FadeInAnimation(
          child: Container(
            height: context.height * 0.185,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: AppColors.hint,
                width: 1.2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: context.width * 0.085,
                        backgroundColor: AppColors.primary.withOpacity(0.6),
                        backgroundImage: AssetImage(ImageAssets.user),
                      ),
                      SizedBox(
                        width: context.width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name.toString(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '${model.bloodBags} اكياس دم',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            '${model.city.toString()} - ${model.gender} - ${model.age} عام',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const Spacer(),
                      BloodDroop(
                        text: model.bloodType.toString(),
                      ),
                    ],
                  ),
                ),
                const CustomSegmentedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
