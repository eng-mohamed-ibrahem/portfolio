import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        gradient: AppConstants.boxPrimaryLinearGradient,
        border: Border.all(
          color: AppColors.color6971A2.withAlpha(41),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Images Carousel
          if (project.imageUrl.isNotEmpty) _buildImageCarousel(),

          // Project Content
          Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Name
                Text(
                  project.name,
                  style: AppTextStyles.font26Bold(context),
                ),
                SizedBox(height: 16.h),

                // Project Description
                Text(
                  project.description,
                  style: AppTextStyles.font16Medium(context).copyWith(
                    color: AppColors.colorBEC1DD,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 24.h),

                // Action Buttons
                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  children: [
                    if (project.githubUrl.isNotEmpty)
                      _buildActionButton(
                        context,
                        icon: Icons.code,
                        label: 'GitHub',
                        onTap: () => _launchUrl(project.githubUrl),
                      ),
                    if (project.googlePlayUrl.isNotEmpty)
                      _buildActionButton(
                        context,
                        icon: Icons.android,
                        label: 'Google Play',
                        onTap: () => _launchUrl(project.googlePlayUrl),
                      ),
                    if (project.appStoreUrl.isNotEmpty)
                      _buildActionButton(
                        context,
                        icon: Icons.apple,
                        label: 'App Store',
                        onTap: () => _launchUrl(project.appStoreUrl),
                      ),
                    if (project.downloadUrl.isNotEmpty)
                      _buildActionButton(
                        context,
                        icon: Icons.download,
                        label: 'Download',
                        onTap: () => _launchUrl(project.downloadUrl),
                      ),
                    if (project.promoUrl.isNotEmpty)
                      _buildActionButton(
                        context,
                        icon: Icons.play_circle_outline,
                        label: 'Promo',
                        onTap: () => _launchUrl(project.promoUrl),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 250.h,
      child: PageView.builder(
        itemCount: project.imageUrl.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.r),
              topRight: Radius.circular(23.r),
            ),
            child: Image.network(
              project.imageUrl[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.color6971A2.withAlpha(41),
                  child: Icon(
                    Icons.image_not_supported,
                    size: 64.sp,
                    color: AppColors.colorBEC1DD,
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.color6971A2.withAlpha(77),
            width: 1.w,
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.color6971A2.withAlpha(26),
              AppColors.color6971A2.withAlpha(13),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20.sp, color: AppColors.colorBEC1DD),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppTextStyles.font16Medium(context).copyWith(
                color: AppColors.colorBEC1DD,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
