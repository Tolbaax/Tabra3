import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/config/routes/routes.dart';
import 'package:tabra3/core/functions/navigation.dart';
import 'package:tabra3/core/functions/validation.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/constants.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/functions/app_dialogs.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_filed.dart';
import '../cubit/donor_cubit.dart';
import '../cubit/donor_states.dart';

class SearchDonate extends StatefulWidget {
  final String text;

  const SearchDonate({Key? key, required this.text}) : super(key: key);

  @override
  State<SearchDonate> createState() => _SearchDonateState();
}

class _SearchDonateState extends State<SearchDonate> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  int selectedBlood = 6;

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonorCubit, DonorStates>(
      listener: (context,state){
        if (state is GetDonorByAddressSuccess) {
          navigateTo(context, Routes.searchDonateResult);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              title: Text(widget.text),
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.selectBlood,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: context.height * 0.18,
                      child: GridView.count(
                        crossAxisCount: 4,
                        childAspectRatio: context.height * 0.0015,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: context.height * 0.054,
                        children: List.generate(
                          8,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBlood = index;
                              });
                            },
                            child: Container(
                              height: context.height * 0.004,
                              width: context.height * 0.004,
                              decoration: BoxDecoration(
                                color: selectedBlood == index
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary,
                                    blurRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  Constants().bloods[index],
                                  style: TextStyle(
                                    color: selectedBlood == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.08,
                    ),
                    CustomTextFiled(
                      controller: _addressController,
                      hintText: AppStrings.selectPLace,
                      suffixIcon: Icons.location_on_outlined,
                      validator: (value) => Validators.validateAddress(value),
                    ),
                    SizedBox(
                      height: context.height * 0.08,
                    ),
                    Center(
                      child: CustomButton(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await DonorCubit.get(context).getDonorByAddress(
                                _addressController.text.trim());
                          }
                        },
                        text: AppStrings.searchDonate,
                        condition: state is GetDonorByAddressLoading,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
