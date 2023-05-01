import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes.dart';
import '../../../core/utils/app_strings.dart';

class DonorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DonorAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        title: const Text(
          AppStrings.donors,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.searchDonate,
                arguments: AppStrings.searchDonate,
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 45.0.h);
}
