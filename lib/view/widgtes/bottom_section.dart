import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/utils/websites_laucnher/websites_launcher.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                WebsitesLauncher.launchWebsite('https://wa.me/+201275314934');
              },
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                WebsitesLauncher.launchWebsite(
                    'https://www.facebook.com/mohamed.data13');
              },
              icon: const Icon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                WebsitesLauncher.launchWebsite(
                    'https://www.linkedin.com/in/mohamed-ibrahem13/');
              },
              icon: const Icon(
                FontAwesomeIcons.linkedin,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {
                WebsitesLauncher.launchWebsite(
                    'https://github.com/eng-mohamed-ibrahem');
              },
              icon: const Icon(
                FontAwesomeIcons.github,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Text(
          'Made with Flutter',
          style: AppTextStyles.bodySmall.copyWith(
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
