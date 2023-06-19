import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'urgent_case_card.dart';

class AllUrgentCases extends StatelessWidget {
  const AllUrgentCases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is GetAllUrgentCaseLoading) {
          return CircularProgressIndicator(color: AppColors.primary);
        }

        if (state is GetAllUrgentCaseSuccess) {
          if (state.urgentCase.isEmpty) {
            return Center(child: const Text('No Urgent Cases Yet'));
          } else {
            return ListView.separated(
              itemCount: state.urgentCase.length,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return UrgentCaseCard(
                  model: state.urgentCase[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: context.height * 0.02,
                );
              },
            );
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
