import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/core/widgets/custom_button.dart';
import 'package:tabra3/core/widgets/custom_text_filed.dart';

class RegisterNewDonor extends StatelessWidget {
  const RegisterNewDonor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            AppStrings.newDonor,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextFiled(
                  hintText: AppStrings.donorName,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: context.height * 0.035,
                ),
                const CustomTextFiled(
                  hintText: AppStrings.phoneNumber,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: context.height * 0.035,
                ),
                const CustomTextFiled(
                  hintText: AppStrings.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: context.height * 0.035,
                ),
                const CustomTextFiled(
                  hintText: AppStrings.selectBlood,
                ),
                SizedBox(
                  height: context.height * 0.035,
                ),
                const CustomTextFiled(hintText: AppStrings.selectGov),
                SizedBox(
                  height: context.height * 0.06,
                ),
                const CustomButton(text: AppStrings.register),
              ],
            ),
          ),
        ),
      ),
    );
  }
}