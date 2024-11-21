import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/view/widgtes/works_section.dart';

class Works extends StatelessWidget {
  const Works({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width > 600
              ? MediaQuery.sizeOf(context).width * 0.12
              : 10.w,
          vertical: 5.h,
        ),
        children: [
          Text(
            "works.header".tr(),
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: 30.h),
          const WorksSection(),
        ],
      ),
    );
  }
}
