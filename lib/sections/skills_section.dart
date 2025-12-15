import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/models/skill_model.dart';
import 'package:portfolio_app/widgets/soft_skill_chip.dart';
import 'package:portfolio_app/widgets/technical_skill_card.dart';

class SkillsSection extends StatefulWidget {
  final List<SkillModel> technicalSkills;
  final List<String> softSkills;

  const SkillsSection({
    super.key,
    required this.technicalSkills,
    required this.softSkills,
  });

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _showAllTechnicalSkills = false;

  /// Sorts the technical skills by percent in descending order (100% -> 0%)
  List<SkillModel> _sortTechnicalSkillsByPercent(List<SkillModel> skills) {
    List<SkillModel> sortedSkills = List.from(
      skills,
    ); // Create a copy to avoid modifying original

    sortedSkills.sort((a, b) {
      // Sort in descending order (highest percent first)
      return b.percent.compareTo(a.percent);
    });

    return sortedSkills;
  }

  @override
  Widget build(BuildContext context) {
    // Sort technical skills by percent (highest first) by default
    List<SkillModel> sortedTechnicalSkills = _sortTechnicalSkillsByPercent(
      widget.technicalSkills,
    );

    // Determine how many skills to show based on device size and state
    int maxSkillsToShow;
    if (MediaQuery.of(context).size.width > 900) {
      // Desktop - show 15 skills
      maxSkillsToShow = _showAllTechnicalSkills
          ? sortedTechnicalSkills.length
          : 15;
    } else {
      // Mobile - show 10 skills
      maxSkillsToShow = _showAllTechnicalSkills
          ? sortedTechnicalSkills.length
          : 10;
    }

    List<SkillModel> displayedSkills = sortedTechnicalSkills
        .take(maxSkillsToShow)
        .toList();

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Technical Skills Section Title
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF8B5CF6), // Purple
                          Color(0xFF6366F1), // Indigo
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Technical Skills',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ).animate().fadeIn().slideX(begin: -0.2),

              const SizedBox(height: 40),

              // Technical Skills Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 900
                      ? 3
                      : constraints.maxWidth > 600
                      ? 2
                      : 1;

                  return Column(
                    children: [
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: displayedSkills.asMap().entries.map((entry) {
                          final index = entry.key;
                          final skill = entry.value;
                          final itemWidth =
                              (constraints.maxWidth -
                                  (16 * (crossAxisCount - 1))) /
                              crossAxisCount;

                          return SizedBox(
                            width: itemWidth,
                            child: TechnicalSkillCard(
                              skill: skill,
                              delay: (index * 50).ms,
                            ),
                          );
                        }).toList(),
                      ),

                      // Show More/Show Less Button
                      if (sortedTechnicalSkills.length >
                          (constraints.maxWidth > 900 ? 15 : 10))
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child:
                              ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _showAllTechnicalSkills =
                                            !_showAllTechnicalSkills;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      side: BorderSide(
                                        color: const Color(
                                          0xFF8B5CF6,
                                        ).withValues(alpha: 0.5),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: Text(
                                      _showAllTechnicalSkills
                                          ? 'Show Less'
                                          : 'See More Skills',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                  .animate()
                                  .fadeIn(
                                    delay: (displayedSkills.length * 50).ms,
                                  )
                                  .slideY(begin: 0.2),
                        ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 64),

              // Soft Skills Section Title
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF10B981), // Emerald
                          Color(0xFF059669), // Darker Emerald
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Soft Skills',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),

              const SizedBox(height: 40),

              // Soft Skills Chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: widget.softSkills.asMap().entries.map((entry) {
                  final index = entry.key;
                  final skill = entry.value;
                  return SoftSkillChip(
                    skill: skill,
                    colorIndex: index,
                  ).animate().fadeIn(delay: (500 + index * 50).ms).scale();
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
