import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../data/models/donor_model.dart';
import '../../donors/widgets/donor_card.dart';
import '../cubit/recipient_cubit.dart';
import '../cubit/recipient_states.dart';
import '../widgets/recipient_appbar.dart';

class RecipientScreen extends StatelessWidget {
  const RecipientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const RecipientAppBar(),
        body: BlocConsumer<RecipientCubit, RecipientStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetAllRecipientLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is GetAllRecipientSuccess) {
              final List<Donor> donors = state.donor;
              if (donors.isEmpty) {
                return Center(child: const Text('No Recipient Yet'));
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
            }
            return Container();
          },
        ),
      ),
    );
  }
}
