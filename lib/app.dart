import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/features/presentation/view/donors/cubit/search_donate_cubit.dart';

import 'config/routes/routes.dart';
import 'config/themes/app_theme.dart';
import 'core/services/injection_container.dart';
import 'features/presentation/view/donors/cubit/donor_cubit.dart';
import 'features/presentation/view/home/cubit/home_cubit.dart';
import 'features/presentation/view/recipient/cubit/recipient_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => sl<HomeCubit>()..getAllUrgentCases()),
            BlocProvider(
              create: (context) => sl<DonorCubit>()..getAllDonors(),
            ),
            BlocProvider(
                create: (context) => sl<RecipientCubit>()..getAllRecipients()),
            BlocProvider(
                create: (context) => sl<SearchDonateCubit>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        );
      },
    );
  }
}
