import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../data/models/donor_model.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_states.dart';
import '../widgets/donor_card.dart';
import '../widgets/donors_appbar.dart';

class DonorsScreen extends StatelessWidget {
  const DonorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DonorAppBar(),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is GetAllDonorLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is GetAllDonorSuccess) {
            final List<Donor> donors = state.donor;
            if (donors.isEmpty) {
              return Center(child: const Text('No Donors Yet'));
            } else {
              return ListView.separated(
                itemCount: donors.length,
                reverse: true,
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
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
