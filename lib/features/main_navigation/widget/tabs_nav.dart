import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/shared_widgets/glassmorphic_container.dart';
import 'package:portfolio/cubit/landing_cubit.dart';

class TabsNav extends StatelessWidget {
  const TabsNav({super.key, this.verticalMargin});

  final double? verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassmorphicContainer(
        blur: 15.0,
        opacity: 0.15,
        borderRadius: 24.0,
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin ?? 12.h,
          horizontal: 16.w,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            AppConstants.headerTitlesKeys.length,
            (index) => BlocSelector<LandingCubit, LandingState, int>(
              selector: (state) => state.selectedTabNavIndex,
              builder: (context, selectedTabNavIndex) {
                final isSelected = selectedTabNavIndex == index;
                return _NavItem(
                  title: AppConstants.headerTitlesKeys[index],
                  isSelected: isSelected,
                  onTap: () => context.read<LandingCubit>().selectTabNav(index),
                );
              },
            ),
            growable: false,
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: widget.isSelected
              ? const LinearGradient(
                  colors: AppColors.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          boxShadow: widget.isSelected
              ? [
                  const BoxShadow(
                    color: AppColors.glowPrimary,
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 12.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: AppTextStyles.font16Medium(context).copyWith(
                      color: widget.isSelected
                          ? AppColors.textPrimary
                          : _isHovered
                              ? AppColors.textSecondary
                              : AppColors.textTertiary,
                      fontWeight:
                          widget.isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                    child: Text(widget.title),
                  ),
                  SizedBox(height: 6.h),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    height: 3.h,
                    width: widget.isSelected ? 32.w : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      gradient: widget.isSelected
                          ? const LinearGradient(
                              colors: AppColors.accentGradient,
                            )
                          : null,
                      boxShadow: widget.isSelected
                          ? [
                              const BoxShadow(
                                color: AppColors.glowAccent,
                                blurRadius: 8,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
