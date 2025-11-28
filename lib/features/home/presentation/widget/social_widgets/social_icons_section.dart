import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/utils/runtime_cache/runtime_cache.dart';
import 'package:portfolio/features/home/presentation/widget/social_widgets/social_icon_item.dart';

class SocialIconsSection extends StatelessWidget {
  const SocialIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        inject<RuntimeCache>().socialIcons.length,
        (index) => FadeInDown(
          from: (100 + (10 * index)).toDouble(),
          delay: Duration(milliseconds: 200 * index),
          child: SocialIconItem(
            socialIcon: inject<RuntimeCache>().socialIcons[index],
          ),
        ),
        growable: false,
      ),
    );
  }
}
