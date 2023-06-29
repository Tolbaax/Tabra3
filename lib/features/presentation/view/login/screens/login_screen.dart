import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/functions/app_dialogs.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/services/injection_container.dart';
import '../../../../data/datasources/auth/auth_local_datasources.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_states.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';
import '../widgets/not_have_account_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = LoginCubit(sl());
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
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            if (state.response.code == 1) {
              final result = state.response.result!;
              await sl<AuthLocalDataSource>()
                  .setUserLoggedIn(
                    uid: result.token.toString(),
                    name: result.name.toString(),
                    email: result.email.toString(),
                    phoneNumber: result.phoneNumber.toString(),
                  )
                  .then((value) => navigateAndRemove(context, Routes.layout));
            } else {
              AppDialogs.showToast(msg: state.response.message.toString());
            }
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
                        LoginHeader(),
                        LoginForm(),
                        NotHaveAccountButton(),
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
