import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/home/widget/copy_my_email_card.dart';
import 'package:portfolio/features/home/widget/sub_info/prioritize_img.dart';
import 'package:portfolio/features/home/widget/sub_info/tech_enthusiast_card.dart';

class DesktopPassionAndPurposeSection extends StatelessWidget {
  const DesktopPassionAndPurposeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 800
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.mobileHorizontalPadVal.w,
            ),
            margin: EdgeInsets.only(
              top: 100.h,
              bottom: 150.h,
              left: 24.w,
              right: 24.w,
            ),
            child: Wrap(
              spacing: 24.h,
              children: const [
                AspectRatio(
                  aspectRatio: 1.8 / 1,
                  child: AnimatedPrioritizeImg(),
                ),
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.3,
                      child: AnimatedTechEnthusiastCard(),
                    ),
                    AspectRatio(
                      aspectRatio: 2.3,
                      child: AnimatedCopyMyEmailCard(),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Row(
            spacing: 30.w,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                flex: 2,
                child: AnimatedPrioritizeImg(),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 30.h,
                  children: const [
                    AspectRatio(
                      aspectRatio: 351 / 180,
                      child: AnimatedTechEnthusiastCard(),
                    ),
                    // AnimatedTechEnthusiastCard(),
                    // AnimatedCopyMyEmailCard()
                    AspectRatio(
                      aspectRatio: 351 / 180,
                      child: AnimatedCopyMyEmailCard(),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
