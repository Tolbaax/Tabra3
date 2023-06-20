import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/functions/navigation.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/features/presentation/view/home/widgets/register_row.dart';
import 'package:tabra3/features/presentation/view/home/widgets/urgent_case_row.dart';

import '../../../../../core/functions/app_dialogs.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import '../widgets/all_urgent_cases.dart';
import '../widgets/custom_carusoal_slider.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) async {
        if (state is AddUrgentCaseSuccess) {
          if (state.response.code == 1) {
            await HomeCubit.get(context).getAllUrgentCases();
            navigatePop(context);
          } else {
            AppDialogs.showToast(msg: state.response.message.toString());
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeAppBar(),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                const CustomCarousalSlider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 13.0.h,
                      ),
                      RegisterRow(),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      UrgentCaseRow(),
                    ],
                  ),
                ),
                Expanded(child: AllUrgentCases()),
              ],
            ),
          ),
        );
      },
    );
  }
}
