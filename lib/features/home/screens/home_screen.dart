import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tabra3/config/routes.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/assets_manager.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/core/widgets/custom_button.dart';
import 'package:tabra3/core/widgets/custom_text_filed.dart';
import 'package:tabra3/features/home/screens/urgent_cases_list.dart';
import 'package:tabra3/features/home/widgets/custom_card.dart';
import 'package:tabra3/features/home/widgets/header.dart';
import 'package:tabra3/features/home/widgets/urgent_case_card.dart';
import 'package:tabra3/models/usrgent_case_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            end: context.toPadding * 0.45,
            start: context.toPadding * 0.45,
            top: context.toPadding * 0.1,
          ),
          child: Column(
            children: [
              const HomeHeader(),
              SizedBox(
                height: context.height * 0.015,
              ),
              CustomTextFiled(
                hintText: AppStrings.selectHospital,
                suffixIcon: Icons.location_on_outlined,
                readOnly: true,
                onTab: () {},
              ),
              SizedBox(
                height: context.height * 0.015,
              ),
              CustomTextFiled(
                hintText: AppStrings.selectBloodBank,
                readOnly: true,
                suffixIcon: Icons.bloodtype_rounded,
                onTab: () {},
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              CustomButton(
                onTab: () {
                  Navigator.pushNamed(context, Routes.searchDonate);
                },
                text: AppStrings.donationRequest,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
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
              ),
              SizedBox(
                height: context.height * 0.016,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.urgentCases,
                    style: Theme.of(context).textTheme.titleLarge!,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.urgentCases);
                    },
                    child: Text(
                      AppStrings.seeAll,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: urgentCases.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AnimationLimiter(
                      child: UrgentCaseCard(
                        model: urgentCases[index],
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: context.height * 0.02,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
