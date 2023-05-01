import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabra3/config/routes.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/assets_manager.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/core/widgets/custom_button.dart';
import 'package:tabra3/core/widgets/custom_text_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    ImageAssets.register,
                    height: context.height * 0.25,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      AppStrings.signUp,
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
                    hintText: AppStrings.name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const CustomTextFiled(
                    hintText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const CustomTextFiled(
                    hintText: AppStrings.phoneNumber,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  const CustomTextFiled(
                    hintText: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 60.0.h,
                  ),
                  CustomButton(
                    onTab: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.login, (route) => false);
                    },
                    text: AppStrings.signUp,
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.haveAccount),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          AppStrings.login,
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
