import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../../core/services/injection_container.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../data/models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBoardings.length,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingPage(
                    image: onBoardings[index].img,
                    title1: onBoardings[index].title1,
                    title2: onBoardings[index].title2,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                end: 18.0,
                bottom: 25.0,
                start: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothIndicator(activeIndex: pageIndex),
                  SizedBox(
                    height: context.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        if (pageIndex >= 2) {
                          goToLogin();
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToLogin() {
    sl<CacheHelper>()
        .saveData(key: AppStrings.isBoarding, value: AppStrings.isBoarding);
    Navigator.pushReplacementNamed(context, Routes.login);
  }
}
