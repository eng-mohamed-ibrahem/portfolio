import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class AppTextStyles {
  static TextStyle get bodyLarge => TextStyle(
        color: AppColors.dark,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get bodySmall => TextStyle(
        color: AppColors.dark,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get textButton => TextStyle(
        color: AppColors.wight,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get bodyMedium => TextStyle(
        color: AppColors.dark,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get light => TextStyle(
        color: AppColors.light,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      );
}
