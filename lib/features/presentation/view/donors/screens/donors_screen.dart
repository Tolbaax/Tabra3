import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../data/models/donors_model.dart';
import '../widgets/donor_card.dart';
import '../widgets/donors_appbar.dart';

class DonorsScreen extends StatelessWidget {
  const DonorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const DonorAppBar(),
        body: Padding(
          padding: EdgeInsets.all(context.toPadding * 0.45),
          child: AnimationLimiter(
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
                  height: context.height * 0.02,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}