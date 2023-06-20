import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_strings.dart';


class RecipientAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipientAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        title: const Text(
          AppStrings.bloodPatient,
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
                arguments: AppStrings.searchBloodPatient,
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
