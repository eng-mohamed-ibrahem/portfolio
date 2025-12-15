import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/resume_model.dart';
import '../widgets/glass_widgets.dart';

class EducationSection extends StatelessWidget {
  final List<EducationData> education;

  const EducationSection({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
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
                    'Education',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ).animate().fadeIn().slideX(begin: -0.2),

              const SizedBox(height: 40),

              // Education List
              ...education.asMap().entries.map((entry) {
                final index = entry.key;
                final edu = entry.value;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: GlassContainer(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          edu.institution,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          edu.degree,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          edu.period,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: (index * 100).ms).scale(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
