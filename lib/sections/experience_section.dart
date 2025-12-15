import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/models/experience_model.dart';

import '../widgets/glass_widgets.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceModel> experience;

  const ExperienceSection({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          'Experience',
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ).animate().fadeIn().slideX(begin: -0.2),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final exp = experience[index];
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child:
                        GlassContainer(
                              padding: const EdgeInsets.all(24),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final isMobile = constraints.maxWidth < 600;

                                  final logo = exp.companyLogoUrl.isNotEmpty
                                      ? Container(
                                          margin: const EdgeInsets.only(
                                            right: 16.0,
                                          ),
                                          width: 64,
                                          height: 64,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                exp.companyLogoUrl,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : null;

                                  final mainInfo = Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        exp.jobTitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        exp.companyName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                      ),
                                    ],
                                  );

                                  final metaInfo = Column(
                                    crossAxisAlignment: isMobile
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        _formatDateRange(
                                          exp.startDate,
                                          exp.endDate,
                                        ),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        exp.companyType,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.color
                                                  ?.withValues(alpha: 0.7),
                                            ),
                                      ),
                                    ],
                                  );

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (isMobile)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                if (logo != null) logo,
                                                Expanded(child: mainInfo),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            metaInfo,
                                          ],
                                        )
                                      else
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (logo != null) logo,
                                            Expanded(child: mainInfo),
                                            metaInfo,
                                          ],
                                        ),
                                      if (exp
                                          .descriptionInPoints
                                          .isNotEmpty) ...[
                                        const SizedBox(height: 16),
                                        ...exp.descriptionInPoints.map(
                                          (highlight) => Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                    top: 8,
                                                  ),
                                                  width: 6,
                                                  height: 6,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    highlight,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  );
                                },
                              ),
                            )
                            .animate()
                            .fadeIn(delay: (index * 100).ms, duration: 500.ms)
                            .slideX(begin: -0.1),
                  ),
                ),
              );
            }, childCount: experience.length),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime startDate, DateTime? endDate) {
    final start = '${_getMonthName(startDate.month)} ${startDate.year}';
    if (endDate == null) {
      return '$start - Present';
    }
    final end = '${_getMonthName(endDate.month)} ${endDate.year}';
    return '$start - $end';
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
