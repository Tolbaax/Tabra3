import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/presentation/view/home/screens/register_blood_patient.dart';
import '../../features/presentation/view/home/screens/register_new_donor.dart';
import '../../features/presentation/view/home/screens/register_urgent_cases.dart';
import '../../features/presentation/view/home/screens/search_donate.dart';
import '../../features/presentation/view/home/screens/urgent_cases_list.dart';
import '../../features/presentation/view/layout/layout_screen.dart';
import '../../features/presentation/view/login/screens/login_screen.dart';
import '../../features/presentation/view/onboarding/screens/onboarding_screen.dart';
import '../../features/presentation/view/register/screens/register_screen.dart';
import '../../features/presentation/view/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String layout = '/layout';
  static const String urgentCases = '/urgentCases';
  static const String searchDonate = '/searchDonate';
  static const String newDonor = '/newDonor';
  static const String registerUrgent = '/registerUrgent';
  static const String bloodPatient = '/bloodPatient';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.onBoarding:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const OnBoardingScreen(),
        );

      case Routes.layout:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const LayoutScreen(),
        );

      case Routes.urgentCases:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const UrgentCasesList(),
        );

      case Routes.searchDonate:
        final String text = settings.arguments as String;
        return PageTransition(
          type: PageTransitionType.fade,
          child: SearchDonate(text: text),
        );

      case Routes.newDonor:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const RegisterNewDonor(),
        );

      case Routes.registerUrgent:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const RegisterUrgentCases(),
        );

      case Routes.bloodPatient:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const RegisterBloodPatient(),
        );

      case Routes.login:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const LoginScreen(),
        );

      case Routes.register:
        return PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: RegisterScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: const Scaffold(
            body: Center(
              child: Text(
                AppStrings.noRouteFound,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      },
    );
  }
}
