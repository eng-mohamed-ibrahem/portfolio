import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/shared_widgets/glassmorphic_container.dart';
import 'package:portfolio/core/shared_widgets/my_sized_box.dart';
import 'package:portfolio/core/utils/functions/open_url.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    required this.project,
    this.isTablet = false,
  });

  final ProjectEntity project;
  final bool isTablet;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -8.0 : 0.0, 0.0),
        child: GlassmorphicContainer(
          blur: 20.0,
          opacity: 0.1,
          borderRadius: 24.0,
          padding: EdgeInsets.all(24.w),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primary.withOpacity(0.2)
                  : AppColors.shadowMedium,
              blurRadius: _isHovered ? 32 : 20,
              offset: Offset(0, _isHovered ? 16 : 12),
            ),
          ],
          child: widget.isTablet
              ? Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildProjectImage(),
                    ),
                    MySizedBox.width16,
                    Expanded(
                      flex: 2,
                      child: _buildProjectContent(),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildProjectImage(),
                    MySizedBox.height32,
                    _buildProjectContent(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildProjectImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Project image
            CachedNetworkImage(
              imageUrl: widget.project.imageUrl.isNotEmpty
                  ? widget.project.imageUrl
                  : '',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: Icon(
                  Icons.image,
                  color: AppColors.textTertiary,
                  size: 48.sp,
                ),
              ),
            ),
            // Gradient overlay on hover
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isHovered ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGradient[0].withOpacity(0.6),
                      AppColors.primaryGradient[1].withOpacity(0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.project.name,
          style: AppTextStyles.font26Bold(context).copyWith(
            color: AppColors.textPrimary,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(height: 12.h),
        Text(
          widget.project.description,
          style: AppTextStyles.font16Regular(context).copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          maxLines: widget.isTablet ? 4 : 3,
          overflow: TextOverflow.ellipsis,
        ),
        MySizedBox.height14,
        _buildProjectLinks(project: widget.project),
      ],
    );
  }

  Widget _buildProjectLinks({required ProjectEntity project}) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      alignment: WrapAlignment.start,
      children: [
        if (project.googlePlayUrl.isNotEmpty)
          ProjectItemTextButton(
            url: project.googlePlayUrl,
            title: const Text(AppStrings.googlePlay),
            icon: const Icon(
              FontAwesomeIcons.googlePlay,
              color: AppColors.textPrimary,
            ),
          ),
        if (project.appStoreUrl.isNotEmpty)
          ProjectItemTextButton(
            url: project.appStoreUrl,
            title: const Text(AppStrings.appStore),
            icon: const Icon(
              FontAwesomeIcons.apple,
              color: AppColors.textPrimary,
            ),
          ),
        if (project.downloadUrl.isNotEmpty)
          ProjectItemTextButton(
            url: project.downloadUrl,
            title: const Text(AppStrings.downloadApp),
            icon: SvgPicture.asset(
              Assets.svgsDownloadIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        if (project.githubUrl.isNotEmpty)
          ProjectItemTextButton(
            url: project.githubUrl,
            title: const Text(AppStrings.viewOnGitHub),
            icon: SvgPicture.asset(
              Assets.svgsGithubIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        if (project.promoUrl.isNotEmpty)
          ProjectItemTextButton(
            url: project.promoUrl,
            title: const Text(AppStrings.seeThePromo),
            icon: SvgPicture.asset(
              Assets.svgsPlay,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
      ],
    );
  }
}

class ProjectItemTextButton extends StatefulWidget {
  const ProjectItemTextButton({
    super.key,
    required this.url,
    required this.title,
    required this.icon,
  });

  final String url;
  final Widget icon, title;

  @override
  State<ProjectItemTextButton> createState() => _ProjectItemTextButtonState();
}

class _ProjectItemTextButtonState extends State<ProjectItemTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: _isHovered
              ? const LinearGradient(
                  colors: AppColors.accentGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          border: Border.all(
            color: _isHovered ? AppColors.accent : AppColors.glassBorder,
            width: 1,
          ),
        ),
        child: TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: AppTextStyles.font14Medium(context),
            foregroundColor:
                _isHovered ? AppColors.textPrimary : AppColors.textSecondary,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
          ),
          onPressed: () async => await openUrl(widget.url),
          icon: widget.icon,
          label: widget.title,
        ),
      ),
    );
  }
}
