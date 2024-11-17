import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/viewmodel/skills_viewmodel/skills_viewmodel.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.skill,
  });
  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsViewModel, SkillsViewModelState>(
      builder: (context, state) {
        bool expand = context.read<SkillsViewModel>().selectedSkill == skill;
        return Material(
          child: Column(
            children: [
              MouseRegion(
                onEnter: kIsWeb
                    ? (event) {
                        context.read<SkillsViewModel>().setSelectedSkill(skill);
                      }
                    : null,
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: kIsWeb
                      ? null
                      : () {
                          context
                              .read<SkillsViewModel>()
                              .setSelectedSkill(skill);
                        },
                  child: Chip(
                    avatar: CircleAvatar(
                      radius: 5.r,
                      backgroundColor:
                          expand ? AppColors.secondary : AppColors.primary,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.h),
                    elevation: 3,
                    shadowColor: AppColors.wight,
                    labelStyle: AppTextStyles.bodySmall,
                    label: Text(skill.title),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                child: expand
                    ? Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        alignment: WrapAlignment.center,
                        children: skill.subSkills.map(
                          (subSkill) {
                            return Chip(
                              elevation: 3,
                              shadowColor: AppColors.wight,
                              labelStyle: AppTextStyles.bodySmall.copyWith(
                                fontSize: 10.sp,
                              ),
                              label: Text(
                                subSkill,
                              ),
                            );
                          },
                        ).toList(),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      },
    );
  }
}
