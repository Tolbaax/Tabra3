import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/features/data/models/urgent_case_model.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'urgent_case_card.dart';

class AllUrgentCases extends StatelessWidget {
  const AllUrgentCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetAllUrgentCaseLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state is GetAllUrgentCaseSuccess) {
          final List<UrgentCase> urgentCases = state.urgentCase;
          if (urgentCases.isEmpty) {
            return Center(child: const Text('No Urgent Cases Yet'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: urgentCases.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return UrgentCaseCard(
                    model: urgentCases[index],
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
    );
  }
}
