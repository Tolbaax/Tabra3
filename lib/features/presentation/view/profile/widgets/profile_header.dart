import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'custom_card.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.height * 0.38,
          width: context.width,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(35.0),
              bottomRight: Radius.circular(35.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 37.0,
                backgroundImage: AssetImage(ImageAssets.person3),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'احمد منصور',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                '01014025838',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: context.height * 0.015,
              ),
              RatingBar.builder(
                minRating: 0,
                initialRating: 4.5,
                itemSize: context.height * 0.0255,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        ),
        const CustomProfileCard(),
      ],
    );
  }
}
