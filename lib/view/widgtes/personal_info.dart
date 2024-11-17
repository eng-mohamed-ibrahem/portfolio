import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/app_images/app_images.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisible(
      key: const Key('personal_info'),
      duration: const Duration(milliseconds: 350),
      reAnimateOnVisibility: true,
      builder: (
        BuildContext context,
        Animation<double> animation,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.5),
          end: Offset.zero,
        ).animate(animation),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Check if screen is wide enough to keep items in one row
              bool isWideScreen = constraints.maxWidth > 600;
              return isWideScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _profileInfo(isWideScreen: true),
                        ),
                        _avatar(),
                      ],
                    )
                  : Column(
                      children: [
                        _avatar(),
                        _profileInfo(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _profileInfo({
    bool isWideScreen = false,
  }) {
    return Column(
      crossAxisAlignment:
          isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text(
          "Hi, I am Mohamed,\nSoftware Engineer\n&\nFlutter Developer",
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge,
        ),
        SizedBox(height: 15.h),
        Text(
          "I'm a software engineer with a passion for creating innovative and user-friendly applications.",
          textAlign: isWideScreen ? TextAlign.start : TextAlign.center,
          style: AppTextStyles.bodyMedium,
        ),
        SizedBox(height: 25.h),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "home.personal_info.download_resume".tr(),
            style: AppTextStyles.textButton,
          ),
        ),
      ],
    );
  }

  CircleAvatar _avatar() {
    return CircleAvatar(
      radius: 100.r,
      backgroundColor: Colors.transparent,
      backgroundImage: const AssetImage(AppImages.profile),
    );
  }
}
