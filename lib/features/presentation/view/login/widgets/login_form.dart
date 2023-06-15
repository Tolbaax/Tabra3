import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/params/signin_params.dart';

import '../../../../../core/functions/validation.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_filed.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_states.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomTextFiled(
              controller: _emailController,
              hintText: AppStrings.email,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Validators.validateEmail(value),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            CustomTextFiled(
              controller: _passwordController,
              hintText: AppStrings.password,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => Validators.validatePassword(value),
            ),
            SizedBox(
              height: 60.0.h,
            ),
            CustomButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await LoginCubit.get(context).login(
                    SignInParams(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    ),
                  );
                }
              },
              text: AppStrings.login,
              condition: state is LoginLoadingState,
            ),
            SizedBox(
              height: 15.0.h,
            ),
          ],
        ),
      );
    });
  }
}
