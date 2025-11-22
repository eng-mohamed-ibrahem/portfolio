import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experience});
  final ExperienceEntity experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 52.h,
        bottom: 30.h,
        start: 52.w,
        end: 52.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        gradient: AppConstants.boxPrimaryLinearGradient,
        border: Border.all(
          color: AppColors.color6971A2.withAlpha(41),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.title,
            style: AppTextStyles.font26Bold(context),
          ),
          SizedBox(height: 12.h),
          Text(
            experience.company,
            style: AppTextStyles.font20Medium(context),
          ),
          SizedBox(height: 8.h),
          Text(
            experience.duration,
            style: AppTextStyles.font16Medium(context).copyWith(
              color: AppColors.colorBEC1DD,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            experience.description,
            style: AppTextStyles.font16Medium(context).copyWith(
              color: AppColors.colorBEC1DD,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
