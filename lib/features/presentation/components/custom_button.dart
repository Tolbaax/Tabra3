import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabra3/core/utils/media_query_values.dart';
import '../../../core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? condition;
  final String text;

  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.condition = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.05,
        width: context.width * 0.75,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.0.sp),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: condition!
              ? CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.5.sp,
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
