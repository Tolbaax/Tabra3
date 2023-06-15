import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/services/injection_container.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../data/datasources/auth/auth_local_datasources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  // use shared preferences to open app in right screen only
  final isBoarding = sl<CacheHelper>().getData(key: AppStrings.isBoarding);

  _goNext() {
    if (isBoarding != null && sl<AuthLocalDataSource>().getUser() != null) {
      navigateAndReplace(context, Routes.layout);
    } else if (isBoarding != null &&
        sl<AuthLocalDataSource>().getUser() == null) {
      navigateAndReplace(context, Routes.login);
    } else {
      navigateAndReplace(context, Routes.onBoarding);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            ImageAssets.splash,
            controller: _controller,
            width: double.infinity,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().then(
                  (value) {
                    _goNext();
                  },
                );
            },
          ),
        ],
      ),
    );
  }
}
