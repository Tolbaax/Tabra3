import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/core/functions/validation.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import 'package:tabra3/features/presentation/view/home/cubit/home_cubit.dart';
import 'package:tabra3/features/presentation/view/home/cubit/home_states.dart';
import 'package:tabra3/features/presentation/view/home/widgets/register_urgent_case_appbar.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_filed.dart';

class RegisterUrgentCases extends StatefulWidget {
  const RegisterUrgentCases({Key? key}) : super(key: key);

  @override
  State<RegisterUrgentCases> createState() => _RegisterUrgentCasesState();
}

class _RegisterUrgentCasesState extends State<RegisterUrgentCases> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _cityController = TextEditingController();
  final _bloodBagsController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _bloodTypeController.dispose();
    _cityController.dispose();
    _bloodBagsController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: RegisterAppBar(text: AppStrings.registerUrgentCases),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.0, vertical: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFiled(
                        controller: _nameController,
                        hintText: AppStrings.donorName,
                        keyboardType: TextInputType.name,
                        validator: (value) => Validators.validateName(value),
                      ),
                      SizedBox(
                        height: context.height * 0.035,
                      ),
                      CustomTextFiled(
                        controller: _ageController,
                        hintText: AppStrings.age,
                        keyboardType: TextInputType.phone,
                        validator: (value) => Validators.validateAge(value),
                      ),
                      SizedBox(
                        height: context.height * 0.035,
                      ),
                      CustomTextFiled(
                        controller: _genderController,
                        hintText: AppStrings.gender,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => Validators.validateType(value),
                      ),
                      SizedBox(
                        height: context.height * 0.035,
                      ),
                      CustomTextFiled(
                        controller: _phoneNumberController,
                        hintText: AppStrings.phoneNumber,
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            Validators.validatePhoneNumber(value),
                      ),
                      SizedBox(
                        height: context.height * 0.035,
                      ),
                      CustomTextFiled(
                        controller: _bloodTypeController,
                        hintText: AppStrings.bloodType,
                        validator: (value) => Validators.validateType(value),
                      ),
                      SizedBox(
                        height: context.height * 0.035,
                      ),
                      CustomTextFiled(
                        controller: _cityController,
                        hintText: AppStrings.city,
                        validator: (value) => Validators.validateType(value),
                      ),
                      SizedBox(
                        height: context.height * 0.035,
                      ),
                      CustomTextFiled(
                        controller: _bloodBagsController,
                        hintText: AppStrings.bloodBags,
                        keyboardType: TextInputType.number,
                        validator: (value) => Validators.validateType(value),
                      ),
                      SizedBox(
                        height: context.height * 0.06,
                      ),
                      CustomButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await HomeCubit.get(context).addUrgentCase(
                              AddCaseParams(
                                name: _nameController.text.trim(),
                                age: _ageController.text.trim(),
                                gender: _genderController.text.trim(),
                                PhoneNumber: _phoneNumberController.text.trim(),
                                bloodType: _bloodTypeController.text.trim(),
                                city: _cityController.text.trim(),
                                bloodBags: _bloodBagsController.text.trim(),
                              ),
                            );
                          }
                        },
                        text: AppStrings.register,
                        condition: state is AddUrgentCaseLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
