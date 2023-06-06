import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabra3/config/routes/routes.dart';
import 'package:tabra3/core/functions/navigation.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/assets_manager.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../components/custom_button.dart';
import '../../components/custom_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.all(20.0.sp),
              child: Column(
                children: [
                  SvgPicture.asset(
                    ImageAssets.login,
                    height: context.height * 0.25,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      AppStrings.login,
                      style: TextStyle(
                        fontSize: 25.0.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomTextFiled(
                    hintText: AppStrings.email,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const CustomTextFiled(
                    hintText: AppStrings.password,
                  ),
                  SizedBox(
                    height: 60.0.h,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.layout, (route) => false);
                    },
                    text: AppStrings.login,
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.dontHaveAccount),
                      TextButton(
                        onPressed: () => navigateTo(context, Routes.register),
                        child: const Text(
                          AppStrings.signUp,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
