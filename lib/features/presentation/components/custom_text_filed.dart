import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixTab;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FormFieldValidator? validator;
  final bool readOnly;
  final GestureTapCallback? onTab;

  const CustomTextFiled(
      {super.key,
      this.controller,
      this.keyboardType,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon,
      this.suffixTab,
      this.textInputAction,
      this.validator,
      this.readOnly = false,
      this.onTab});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: readOnly,
      onTap: onTab,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
      validator: validator,
      style: TextStyle(color: Colors.black, fontSize: 14.0.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.symmetric(
          vertical: 5.5.sp,
          horizontal: 16.0.sp,
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.8),
          fontSize: 13.0,
          letterSpacing: 0.5,
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black.withOpacity(0.5),
                size: 20.0,
              )
            : null,
        suffixIcon: (suffixIcon != null)
            ? InkWell(
                onTap: suffixTab,
                radius: 0.0,
                child: Icon(
                  suffixIcon,
                  size: 20.0,
                  color: AppColors.primary,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.sp),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.sp),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.sp),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.sp),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0.sp),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
