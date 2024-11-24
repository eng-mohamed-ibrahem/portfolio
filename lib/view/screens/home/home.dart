import 'package:auto_animated/auto_animated.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/view/widgtes/personal_info.dart';
import 'package:portfolio/view/widgtes/skills_section.dart';
import 'package:portfolio/view/widgtes/works_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late final ProfileModel _profile;

  @override
  void initState() {
    // _profile = ProfileModel.fromJson(
    //   // jsonDecode(
    //   //   await rootBundle.loadString(AppData.personalInfo),
    //   // )
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateIfVisibleWrapper(
        // Show each item through
        showItemInterval: const Duration(milliseconds: 300),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PersonalInfo(),
              SizedBox(height: 20.h),
              Text(
                "skills.title".tr(),
                style: AppTextStyles.bodySmall,
              ),
              const SizedBox(height: 5),
              const SkillsSection(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width > 600
                      ? MediaQuery.sizeOf(context).width * 0.12
                      : 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "works.title".tr(),
                      style: AppTextStyles.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    const WorksSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
