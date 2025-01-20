import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/models/experience_model.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experience});
  final ExperienceModel experience;

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
      child: OverflowBar(
        spacing: 30.w,
        overflowSpacing: 20.h,
        alignment: MainAxisAlignment.center,
        overflowAlignment: OverflowBarAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(experience.companyLogo),
            title: Text(
              experience.companyName,
              style: AppTextStyles.font26Bold(context),
            ),
            subtitle: Text(
              experience.companyType,
              style: AppTextStyles.font16Medium(context).copyWith(
                color: AppColors.colorBEC1DD,
              ),
            ),
          ),
          Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${experience.startDate} - ${experience.endDate}',
                style: AppTextStyles.font26Bold(context),
              ),
              Text(
                experience.jobtitle,
                style: AppTextStyles.font24Bold(context),
              ),
              ...List.generate(
                experience.descriptionInPoinst.length,
                (index) => Row(
                  spacing: 10.w,
                  children: [
                    Icon(
                      Icons.brightness_1,
                      color: AppColors.colorCBACF9,
                      size: 6.r,
                    ),
                    Flexible(
                      child: Text(
                        experience.descriptionInPoinst[index],
                        style: AppTextStyles.font16Medium(context).copyWith(
                          color: AppColors.colorBEC1DD,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
