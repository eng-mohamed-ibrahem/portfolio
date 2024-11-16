import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisibleWrapper(
      delay: const Duration(milliseconds: 150),
      child: Container(
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
              list.length,
              (index) => AnimateIfVisible(
                key: ValueKey(list[index].hashCode),
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
                      child: Chip(
                        labelStyle: AppTextStyles.bodySmall,
                        label: list[index],
                      )
                      // Material(
                      //   borderRadius: BorderRadius.circular(10),
                      //   animationDuration: const Duration(milliseconds: 150),
                      //   color: AppColors.wight,
                      //   textStyle: AppTextStyles.bodyMedium,
                      //   shadowColor: AppColors.wight,
                      //   elevation: 2,
                      //   child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 15, vertical: 5),
                      //       child: list[index]),
                      // ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final list = const [
    Text('Dart'),
    Text('Firebase'),
    Text('Flutter'),
    Text('Dart'),
    Text('Firebase'),
    Text("Go_Router"),
    Text("Socket.io"),
    Text('Flutter'),
    Text('Dart 1651'),
    Text('Firebase'),
    Text('Flutter'),
    Text('Dart'),
    Text('Firebase'),
    Text("Go_Router"),
    Text("Socket.io"),
  ];
}
