import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/features/data/models/donor_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../cubit/donor_cubit.dart';
import '../cubit/donor_states.dart';
import '../widgets/donor_card.dart';

class SearchDonateResultScreen extends StatelessWidget {
  const SearchDonateResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: Text(AppStrings.donors),
        ),
        body: BlocConsumer<DonorCubit, DonorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetDonorByAddressLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is GetDonorByAddressSuccess) {
              final List<Donor> donors = state.donor;
              if (donors.isEmpty) {
                return Center(
                  child: Text(
                    AppStrings.noDonors,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18.0.sp,
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: donors.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return DonorCard(
                        model: donors[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      );
                    },
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
