import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/helpers/extensions.dart';
import 'package:portfolio/features/home/domain/entities/home_entity.dart';

class AnimatedPersonalInfo extends StatelessWidget {
  const AnimatedPersonalInfo({super.key, required this.homeEntity});
  final HomeEntity homeEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 30.h),
      alignment: Alignment.center,
      child: FadeInDown(
        delay: const Duration(milliseconds: 700),
        child: Wrap(
          spacing: 5.h,
          runSpacing: 5.h,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            Text(
              'Hi, I am ${homeEntity.name} ',
              style: AppTextStyles.font24Bold(context),
            ),
            DefaultTextStyle(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyles.font24Bold(context).copyWith(
                color: AppColors.colorCBACF9,
                overflow: TextOverflow.ellipsis,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText(
                    AppStrings.iamSoftwareEngineer,
                    speed: const Duration(milliseconds: 60),
                  ),
                  TyperAnimatedText(
                    AppStrings.iamFlutterDeveloper,
                    speed: const Duration(milliseconds: 60),
                  ),
                  TyperAnimatedText(
                    AppStrings.iamCrossPlatformDeveloper,
                    speed: const Duration(milliseconds: 60),
                  ),
                  TyperAnimatedText(
                    AppStrings.iamDartProgrammer,
                    speed: const Duration(milliseconds: 60),
                  ),
                  TyperAnimatedText(
                    AppStrings.iamUIUXAppDeveloper,
                    speed: const Duration(milliseconds: 60),
                  ),
                ],
                onTap: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
