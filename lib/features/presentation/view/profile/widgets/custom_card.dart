import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/assets_manager.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomProfileCard extends StatefulWidget {
  const CustomProfileCard({Key? key}) : super(key: key);

  @override
  State<CustomProfileCard> createState() => _CustomProfileCardState();
}

class _CustomProfileCardState extends State<CustomProfileCard> {
  late bool isNotification = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -context.height * 0.05,
      child: Container(
        height: context.height * 0.093,
        width: context.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary,
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 8.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height * 0.04,
                    child: const Image(
                      image: AssetImage(ImageAssets.img3),
                    ),
                  ),
                  const Text(
                    '3 مرات تبرع',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        ImageAssets.bloodDrop,
                        height: context.height * 0.04,
                        color: AppColors.primary,
                      ),
                      Positioned(
                        bottom: context.height * 0.005,
                        child: const Text(
                          'B+',
                          style: TextStyle(color: Colors.white, fontSize: 11.5),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'فصيلة الدم',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.height * 0.04,
                    child: Text(
                      '2 مارس',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                  const Text(
                    'التبرع القادم',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
