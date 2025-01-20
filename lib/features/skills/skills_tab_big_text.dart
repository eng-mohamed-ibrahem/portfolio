import 'package:flutter/material.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/widgets/landing_view_big_text.dart';

class SkillsTabBigText extends StatelessWidget {
  const SkillsTabBigText({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingViewBigText(
      textSpans: [
        TextSpan(
          text: '${AppStrings.elevating} ',
          style: AppTextStyles.font72Bold(context).copyWith(
            color: Colors.white,
          ),
        ),
        TextSpan(
          text: AppStrings.mySkills,
          style: AppTextStyles.font72Bold(context).copyWith(
            color: AppColors.colorCBACF9,
          ),
        ),
        TextSpan(
          text: '\n${AppStrings.oneLineCode}',
          style: AppTextStyles.font72Bold(context).copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
