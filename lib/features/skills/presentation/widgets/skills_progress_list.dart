import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/shared_widgets/glassmorphic_container.dart';
import 'package:portfolio/features/skills/domain/entities/skill_entity.dart';

class SkillsProgressList extends StatelessWidget {
  final List<SkillEntity> skills;
  const SkillsProgressList({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = ResponsiveSize.gridCrossAxisCount(
      context,
      mobile: 1,
      smallTablet: 2,
      largeTablet: 2,
      desktop: 3,
    );

    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: MediaQuery.of(context).size.width < 600 ? 3.0 : 2.5,
          crossAxisSpacing: ResponsiveSize.spacing(context, base: 16.0),
          mainAxisSpacing: ResponsiveSize.spacing(context, base: 16.0),
        ),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 600),
            columnCount: crossAxisCount,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _SkillCard(skill: skills[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillEntity skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onHoverEnter() {
    setState(() => _isHovered = true);
    _hoverController.forward();
  }

  void _onHoverExit() {
    setState(() => _isHovered = false);
    _hoverController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = ResponsiveSize.borderRadius(context, base: 16.0);
    final cardPadding = ResponsivePadding.card(context);

    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GlassmorphicContainer(
              blur: 20.0,
              opacity: 0.1,
              borderRadius: borderRadius,
              padding: EdgeInsets.all(cardPadding * 0.75),
              border: true,
              borderWidth: 1.5,
              borderColor: _isHovered
                  ? AppColors.accent.withValues(alpha: 0.4)
                  : AppColors.glassBorder.withValues(alpha: 0.3),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? AppColors.primary.withValues(alpha: 0.25)
                      : AppColors.shadowMedium.withValues(alpha: 0.3),
                  blurRadius: _isHovered ? 24 : 12,
                  offset: Offset(0, _isHovered ? 12 : 6),
                  spreadRadius: _isHovered ? 2 : 0,
                ),
                if (_isHovered)
                  BoxShadow(
                    color: AppColors.glowAccent.withValues(alpha: 0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
              ],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.skill.name,
                          style: AppTextStyles.font20Medium(context).copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      _buildLevelBadge(),
                    ],
                  ),
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.width < 600 ? 8.h : 12.h),
                  _buildProgressBar(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLevelBadge() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        gradient: _isHovered
            ? const LinearGradient(
                colors: AppColors.accentGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.3),
                  AppColors.secondary.withValues(alpha: 0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Text(
        widget.skill.level,
        style: AppTextStyles.font14Medium(context).copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1500),
      tween: Tween(begin: 0.0, end: widget.skill.percent),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proficiency',
                  style: AppTextStyles.font14Medium(context).copyWith(
                    color: AppColors.textTertiary,
                    letterSpacing: 0.3,
                  ),
                ),
                Text(
                  '${(value * 100).toInt()}%',
                  style: AppTextStyles.font14Medium(context).copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.width < 600 ? 6.h : 8.h),
            Stack(
              children: [
                // Background track
                Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.glassBorder.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                // Progress fill
                FractionallySizedBox(
                  widthFactor: value,
                  child: Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffFF00C1),
                          Color(0xffF4AC24),
                        ],
                        stops: [0, 1],
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: _isHovered
                          ? [
                              BoxShadow(
                                color: const Color(0xffFF00C1)
                                    .withValues(alpha: 0.5),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
                // Shimmer effect on progress bar
                if (_isHovered)
                  FractionallySizedBox(
                    widthFactor: value,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 600),
                      opacity: _glowAnimation.value * 0.5,
                      child: Container(
                        height: 8.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              AppColors.textPrimary.withValues(alpha: 0.4),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
