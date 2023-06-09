import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/functions/navigation.dart';

import '../../../../../core/services/injection_container.dart';
import '../cubit/signup_cubit.dart';
import '../cubit/signup_states.dart';
import '../widgets/have_button.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final SignUpCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SignUpCubit(sl());
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            navigatePop(context);
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(20.0.sp),
                    child: Column(
                      children: [
                        RegisterHeader(),
                        RegisterForm(),
                        HaveButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
