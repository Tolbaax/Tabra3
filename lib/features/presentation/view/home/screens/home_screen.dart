import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/config/routes/routes.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/assets_manager.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import '../widgets/all_urgent_cases.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_carusoal_slider.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeAppBar(),
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
                  const CustomCarousalSlider(),
                  SizedBox(
                    height: 15.0.h,
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
                    height: context.height * 0.02,
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
                  AllUrgentCases(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
