import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';

class SkillsProgressList extends StatelessWidget {
  final List<SkillEntity> skills;
  const SkillsProgressList({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 12.h,
      children: skills.map((skill) => _buildSkillItem(context, skill)).toList(),
    );
  }

  Widget _buildSkillItem(BuildContext context, SkillEntity skill) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: AppTextStyles.font20Medium(context),
                ),
              ),
              Text(
                skill.level,
                style: AppTextStyles.font16Medium(context).copyWith(
                  color: const Color(0xffBEC1DD),
                ),
              ),
            ],
          ),
          LinearPercentIndicator(
            animation: true,
            lineHeight: 16.h,
            animationDuration: 2000,
            percent: skill.percent, // Convert 0-100 to 0-1
            linearGradient: const LinearGradient(
              colors: [Color(0xffFF00C1), Color(0xffF4AC24)],
              stops: [0, 1],
            ),
            backgroundColor: const Color(0xff5C1CB2).withAlpha(77),
            padding: EdgeInsets.zero,
            barRadius: Radius.circular(24.r),
          ),
        ],
      ),
    );
  }
}
