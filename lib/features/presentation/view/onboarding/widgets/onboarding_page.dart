import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';


class OnBoardingPage extends StatelessWidget {
  final String image, title1, title2;

  const OnBoardingPage({
    Key? key,
    required this.image,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.width * 0.8,
          child: SvgPicture.asset(
            image,
            height: context.height * 0.5,
          ),
        ),
        SizedBox(
          height: context.height * 0.02,
        ),
        Text(
          title1,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          width: context.width * 0.9,
          child: Text(
            title2,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.hint),
          ),
        ),
      ],
    );
  }
}
