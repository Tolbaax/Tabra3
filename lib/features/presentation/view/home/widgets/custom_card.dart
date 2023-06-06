import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';


class CustomCard extends StatelessWidget {
  final GestureTapCallback? onTab;
  final String text;
  final String img;

  const CustomCard({
    Key? key,
    this.onTab,
    required this.text,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: context.height * 0.17,
        width: context.width * 0.28,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.hint),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              height: context.height*0.08,
              image: AssetImage(img),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 5.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
