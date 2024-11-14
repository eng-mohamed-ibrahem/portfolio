import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';

part 'widgets_theme.dart';

class AppThemes {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.primary,
    secondaryHeaderColor: AppColors.secondary,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.primary, brightness: Brightness.dark),
    fontFamily: 'Cairo',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        textStyle: AppTextStyles.textButton,
        backgroundColor: AppColors.primary,
      ),
    ),
  );
}
