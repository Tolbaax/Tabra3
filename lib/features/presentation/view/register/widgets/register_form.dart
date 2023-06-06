import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/functions/navigation.dart';
import 'package:tabra3/core/functions/validation.dart';
import 'package:tabra3/core/params/signup_params.dart';
import 'package:tabra3/features/presentation/view/register/cubit/signup_states.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_filed.dart';
import '../cubit/signup_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomTextFiled(
                controller: _nameController,
                hintText: AppStrings.name,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.validateName(value),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              CustomTextFiled(
                controller: _emailController,
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.validateEmail(value),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              CustomTextFiled(
                controller: _passwordController,
                hintText: AppStrings.password,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: (value) => Validators.validatePassword(value),
              ),
              SizedBox(
                height: 60.0.h,
              ),
              CustomButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await SignUpCubit.get(context).signUp(
                      SignUpParams(
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      ),
                    );
                    navigateTo(context, Routes.login);
                  }
                },
                text: AppStrings.signUp,
                condition: state is SignUpLoadingState,
              ),
              SizedBox(
                height: 15.0.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
