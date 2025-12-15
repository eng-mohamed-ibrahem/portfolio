import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/models/skill_model.dart';
import 'package:portfolio_app/widgets/glass_widgets.dart';

class TechnicalSkillCard extends StatelessWidget {
  final SkillModel skill;
  final Duration delay;

  const TechnicalSkillCard({
    super.key,
    required this.skill,
    required this.delay,
  });

  Color _getLevelColor(String level) {
    switch (level.toLowerCase()) {
      case 'expert':
        return const Color(0xFF10B981); // Green
      case 'advanced':
        return const Color(0xFF06B6D4); // Cyan
      case 'intermediate':
        return const Color(0xFF8B5CF6); // Purple
      case 'beginner':
        return const Color(0xFFF59E0B); // Amber
      default:
        return const Color(0xFF6366F1); // Indigo
    }
  }

  @override
  Widget build(BuildContext context) {
    final levelColor = _getLevelColor(skill.level);

    return GlassContainer(
      padding: const EdgeInsets.all(20),
      color: Colors.white.withValues(alpha: 0.03),
      borderOpacity: 0.1,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skill Name and Level
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: levelColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: levelColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  skill.level,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: levelColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Progress Bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Proficiency',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    '${skill.percent * 100}%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: levelColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: skill.percent,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            levelColor,
                            levelColor.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay).slideY(begin: 0.2);
  }
}
