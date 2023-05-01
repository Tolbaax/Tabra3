import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/core/utils/media_query_values.dart';

import '../../config/routes.dart';
import '../utils/app_colors.dart';

class AppDialogs {
  static void showLogOutDialog(context, {VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Icon(
          CupertinoIcons.exclamationmark_circle,
          size: 55.0.sp,
          color: AppColors.primary,
        ),
        content: Padding(
          padding: EdgeInsetsDirectional.only(top: 7.h),
          child: Column(
            children: [
              Text(
                'Are you leaving?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              Text(
                'Are you sure want to log out?',
                style: TextStyle(fontSize: 14.0.sp),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, Routes.login),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              textStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  static void showHospitalMapDialog(context, {VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Icon(
          CupertinoIcons.location_solid,
          size: 45.0.sp,
          color: AppColors.primary,
        ),
        content: Padding(
          padding: EdgeInsetsDirectional.only(top: 7.h),
          child: Column(
            children: [
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  onPressed: () =>
                      MapsLauncher.launchQuery(AppStrings.hospitals),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.primary.withOpacity(0.7),
                    ),
                  ),
                  child: Text(
                    AppStrings.nearestHospital,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0.h,
              ),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  onPressed: () =>
                      MapsLauncher.launchQuery(AppStrings.bloodBank),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.primary.withOpacity(0.7),
                    ),
                  ),
                  child: Text(
                    AppStrings.nearestBloodBank,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
