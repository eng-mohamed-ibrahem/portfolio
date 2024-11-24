import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/view/widgtes/skill_item.dart';
import 'package:portfolio/viewmodel/skills_viewmodel/skills_viewmodel.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  late final List<SkillModel> skills;
  @override
  void initState() {
    skills = context.read<SkillsViewModel>().skills;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisibleWrapper(
      delay: const Duration(milliseconds: 150),
      child: MouseRegion(
        onExit: (event) {
          context.read<SkillsViewModel>().selectedSkill != null
              ? context.read<SkillsViewModel>().setSelectedSkill(null)
              : null;
        },
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.secondaryLight,
          ),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...List.generate(
                skills.length,
                (index) => AnimateIfVisible(
                  key: ValueKey(skills[index].hashCode),
                  reAnimateOnVisibility: true,
                  duration: const Duration(milliseconds: 350),
                  builder: (
                    BuildContext context,
                    Animation<double> animation,
                  ) =>
                      SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-0.1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(animation),
                      child: SkillItem(
                        skill: skills[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
