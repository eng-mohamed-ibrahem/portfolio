import 'package:flutter/material.dart';

class SoftSkillChip extends StatelessWidget {
  final String skill;
  final int colorIndex;

  const SoftSkillChip({
    super.key,
    required this.skill,
    required this.colorIndex,
  });

  // Gradient colors for soft skills - matching the design
  static const List<List<Color>> _gradients = [
    [Color(0xFF8B5CF6), Color(0xFF6366F1)], // Purple
    [Color(0xFF06B6D4), Color(0xFF0EA5E9)], // Cyan
    [Color(0xFF10B981), Color(0xFF059669)], // Emerald
    [Color(0xFFF59E0B), Color(0xFFEA580C)], // Amber to Orange
    [Color(0xFFEC4899), Color(0xFFDB2777)], // Pink
    [Color(0xFF6366F1), Color(0xFF8B5CF6)], // Indigo
  ];

  @override
  Widget build(BuildContext context) {
    final gradientColors = _gradients[colorIndex % _gradients.length];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientColors[0].withValues(alpha: 0.15),
            gradientColors[1].withValues(alpha: 0.15),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: gradientColors[0].withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Text(
        skill,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: gradientColors[0],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
