import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/model/work_model/work_model.dart';
import 'package:portfolio/view/widgtes/work_card.dart';
import 'package:portfolio/viewmodel/works_viewmodel/work_viewmodel.dart';

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
    var works = context.read<WorkViewModel>().works;
    return LiveList.options(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index, animation) {
        return InkWell(
          onTap: () {
            context.goNamed(
              Routes.workDetails.name,
              pathParameters: {
                'id': works[index].id,
              },
              queryParameters: {
                "name": works[index].title,
              },
            );
          },
          child: _buildAnimatedItem(context, index, animation, works),
        );
      },
      itemCount: works.length,
      options: options,
    );
  }

  Widget _buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
    List<WorkModel> works,
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
            work: works[index],
          ),
        ),
      );
}
