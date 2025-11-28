import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/experience/domain/entities/experience_entity.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experience});
  final ExperienceEntity experience;

  String _formatDuration() {
    final end = experience.endDate ?? 'Present';
    return '${experience.startDate} - $end';
  }

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
          Row(
            children: [
              // Company Logo
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: NetworkImage(experience.companyLogoUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Job Title
                    Text(
                      experience.jobTitle,
                      style: AppTextStyles.font26Bold(context),
                    ),
                    SizedBox(height: 6.h),
                    // Company Name & Type
                    Text(
                      '${experience.companyName} • ${experience.companyType}',
                      style: AppTextStyles.font20Medium(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Duration
          Text(
            _formatDuration(),
            style: AppTextStyles.font16Medium(context).copyWith(
              color: AppColors.colorBEC1DD,
            ),
          ),
          SizedBox(height: 24.h),
          // Description Points
          ...experience.descriptionInPoints.map(
            (point) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8.h, right: 12.w),
                    width: 6.w,
                    height: 6.h,
                    decoration: const BoxDecoration(
                      color: AppColors.colorBEC1DD,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: AppTextStyles.font16Medium(context).copyWith(
                        color: AppColors.colorBEC1DD,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
