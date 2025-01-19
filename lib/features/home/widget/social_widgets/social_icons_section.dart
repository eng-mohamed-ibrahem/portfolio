import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/features/home/widget/social_widgets/social_icon_item.dart';
import 'package:portfolio/models/social_icon_model.dart';

class SocialIconsSection extends StatelessWidget {
  const SocialIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        SocialIconModel.socialIcons.length,
        (index) => FadeInDown(
          from: (100 + (10 * index)).toDouble(),
          delay: Duration(milliseconds: 200 * index),
          child: SocialIconItem(
            socialIcon: SocialIconModel.socialIcons[index],
          ),
        ),
        growable: false,
      ),
    );
  }
}
