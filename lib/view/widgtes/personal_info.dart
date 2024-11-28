import 'dart:html' as html; // for web

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
          "I'm a Software Engineer With a Passion For Creating Innovative And User-Friendly Applications.",
          textAlign: isWideScreen ? TextAlign.start : TextAlign.center,
          style: AppTextStyles.bodyMedium,
        ),
        SizedBox(height: 25.h),
        ElevatedButton(
          onPressed: () {
            openResume(
                'https://drive.google.com/file/d/1iE5afYE0nIKZd7wdteuMnycwPWruYWK4/view?usp=drive_link');
          },
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

  // void _downloadResume(String resumeUrl) async {
  //   final response = await http.get(Uri.parse(resumeUrl));
  //   final bytes = response.bodyBytes;
  //   final blob = html.Blob([bytes]);
  //   final blobUrl = html.Url.createObjectUrlFromBlob(blob);
  //   final anchor = html.AnchorElement(href: blobUrl)
  //     ..setAttribute('download', 'mohamed_ibrahem_flutter_developer.pdf')
  //     ..click();
  //   html.Url.revokeObjectUrl(blobUrl);
  //   anchor.remove();
  // }

  void openResume(String pathUrl) {
    html.window.open(pathUrl, "mohamed_ibrahem_flutter_developer.pdf");
  }

  void downloadLocaleResume(String pathUrl) async {
    var anchor = html.AnchorElement(href: pathUrl);
    anchor.target = 'blank';
    anchor.download = "mohamed_ibrahem_flutter_developer.pdf";
    anchor.click();
    anchor.remove();
  }
}
