import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabra3/core/functions/app_dialogs.dart';
import 'package:tabra3/core/utils/app_colors.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../core/utils/app_strings.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsetsDirectional.only(top: 10.0.h, start: 10.0.w),
        child: Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 20.0.sp,
            letterSpacing: 1.3.sp,
            fontFamily: AppStrings.medievalSharpFont,
          ),
        ),
      ),
      leadingWidth: context.width * 0.3,
      actions: [
        IconButton(
          onPressed: () => AppDialogs.showHospitalMapDialog(context),
          icon: Icon(
            FontAwesomeIcons.hospital,
            color: AppColors.primary,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.bell,
            color: AppColors.hint,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 45.0.h);
}
