import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/features/presentation/view/donors/cubit/donor_cubit.dart';
import 'package:tabra3/features/presentation/view/home/cubit/home_cubit.dart';
import 'package:tabra3/features/presentation/view/recipient/cubit/recipient_cubit.dart';

import 'config/routes/routes.dart';
import 'config/themes/app_theme.dart';
import 'core/services/injection_container.dart';

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
