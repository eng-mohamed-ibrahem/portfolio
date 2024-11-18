import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class AppTextStyles {
  static TextStyle get bodyLarge => const TextStyle(
        color: AppColors.dark,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get bodySmall => const TextStyle(
        color: AppColors.dark,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get textButton => const TextStyle(
        color: AppColors.wight,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get bodyMedium => const TextStyle(
        color: AppColors.dark,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );
  static TextStyle get light => const TextStyle(
        color: AppColors.light,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );
}
