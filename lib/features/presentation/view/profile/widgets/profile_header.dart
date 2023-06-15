import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/services/injection_container.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../data/datasources/auth/auth_local_datasources.dart';
import 'custom_card.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = sl<AuthLocalDataSource>().getUserName();

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
                backgroundImage: AssetImage(ImageAssets.user),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                name! ?? '',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
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
