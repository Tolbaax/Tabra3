import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          ImageAssets.login,
          height: context.height * 0.25,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            AppStrings.login,
            style: TextStyle(
              fontSize: 25.0.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
