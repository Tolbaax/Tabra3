import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../cubit/donor_cubit.dart';
import '../cubit/donor_states.dart';
import '../widgets/donor_card.dart';
import '../widgets/donors_appbar.dart';

class DonorsScreen extends StatelessWidget {
  const DonorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonorAppBar(),
      body: BlocConsumer<DonorCubit, DonorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is GetAllDonorLoading,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            fallback: (context) {
              if (state is GetAllDonorSuccess) {
                final donors = state.donor;

                if (donors.isEmpty) {
                  return Center(child: const Text('No Donors Yet'));
                } else {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
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
                    ),
                  );
                }
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
