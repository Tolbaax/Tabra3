import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/config/app_theme.dart';
import 'package:tabra3/config/routes.dart';
import 'package:tabra3/core/network/local/cache_helper.dart';

void main() async {
  // make sure that everything in methode is finished, then open the app
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
