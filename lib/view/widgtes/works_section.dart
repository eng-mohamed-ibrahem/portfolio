import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/model/work_model/work_model.dart';
import 'package:portfolio/view/widgtes/work_card.dart';

class WorksSection extends StatelessWidget {
  const WorksSection({super.key});
  final options = const LiveOptions(
    // Start animation after
    delay: Duration(milliseconds: 300),
    // Show each item through
    showItemInterval: Duration(milliseconds: 300),
    // Animation duration
    showItemDuration: Duration(milliseconds: 300),
    visibleFraction: 0.05,
    reAnimateOnVisibility: true,
  );

  @override
  Widget build(BuildContext context) {
    return LiveList.options(
      shrinkWrap: true,
      itemBuilder: (context, index, animation) {
        return InkWell(
          onTap: () {
            context.pushNamed(Routes.works.name);
          },
          child: _buildAnimatedItem(context, index, animation),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: 5,
      options: options,
    );
  }

  Widget _buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: WorkCard(
            work: WorkModel(
                title: 'Better One',
                thumbnail: 'assets/images/thumnail.png',
                date: DateTime(2018),
                type: "Mobile Application",
                description:
                    '''give me descrption of flutter developer A Flutter Developer specializes in creating mobile applications using the Flutter framework developed by Google. Flutter developers are skilled in Dart programming language and possess a deep understanding of the entire mobile app development lifecycle. Their primary responsibilities include designing and developing user-friendly applications, implementing various functionalities, and ensuring the performance, quality, and responsiveness of applications. '''),
          ),
        ),
      );
}
