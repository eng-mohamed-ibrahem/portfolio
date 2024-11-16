import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/view/widgtes/personal_info.dart';
import 'package:portfolio/view/widgtes/skills_section.dart';
import 'package:portfolio/view/widgtes/works_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: AnimateIfVisibleWrapper(
        // Show each item through
        showItemInterval: const Duration(milliseconds: 300),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const PersonalInfo(),
            const SizedBox(height: 20),
            Text(
              "skills.title".tr(),
              style: AppTextStyles.bodySmall,
            ),
            const SkillsSection(),
            const SizedBox(height: 20),
            Text(
              "works.title".tr(),
              style: AppTextStyles.bodySmall,
            ),
            const WorksSection(),
          ],
        ),
      ),
    );
  }
}
