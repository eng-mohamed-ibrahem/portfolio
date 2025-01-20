import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/widgets/custom_section_title.dart';

class HowIWork extends StatelessWidget {
  const HowIWork({super.key});

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      alignment: MainAxisAlignment.center,
      spacing: 40.w,
      children: [
        Container(
          margin: EdgeInsets.only(top: 60.h),
          padding: EdgeInsets.all(40.w),
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.r),
            gradient: AppConstants.boxPrimaryLinearGradient,
            border: Border.all(
              color: AppColors.color6971A2.withAlpha(41),
              width: 1.w,
            ),
          ),
          child: Column(
            spacing: 20.h,
            children: [
              SvgPicture.asset(
                Assets.clientProblem,
                height: 100.h,
                width: 100.w,
                alignment: Alignment.center,
              ),
              const CustomSectionTitle(
                whiteSpan: 'Problem\n',
                colorfulSpan: "To Solution",
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60.h),
          padding: EdgeInsets.all(40.w),
          width: 300.w,
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.r),
            gradient: AppConstants.boxPrimaryLinearGradient,
            border: Border.all(
              color: AppColors.color6971A2.withAlpha(41),
              width: 1.w,
            ),
          ),
          child: Column(
            spacing: 20.h,
            children: [
              SvgPicture.asset(
                Assets.clientIdea,
                height: 100.h,
                width: 100.w,
                alignment: Alignment.center,
              ),
              const CustomSectionTitle(
                whiteSpan: 'Idea\n',
                colorfulSpan: "To Life",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
