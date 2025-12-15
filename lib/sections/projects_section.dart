import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/models/project_model.dart';
import 'package:portfolio_app/widgets/glass_widgets.dart';
import 'package:portfolio_app/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1100,
            ), // Increased width for better grid
            child: Column(
              children: [
                const SectionTitle(title: "Projects"),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 380, // Compact width
                    mainAxisExtent:
                        320, // Fixed compact height (previously 520)
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return ProjectCard(project: project)
                        .animate()
                        .fadeIn(delay: (index * 100).ms, duration: 500.ms)
                        .scale(begin: const Offset(0.9, 0.9));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
