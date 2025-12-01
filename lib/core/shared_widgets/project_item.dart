import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/helpers/responsive_padding.dart';
import 'package:portfolio/core/shared_widgets/glassmorphic_container.dart';
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

class _ProjectItemState extends State<ProjectItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<Offset> _imageParallaxAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.03,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: -8.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    _imageParallaxAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.02),
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

  double _getResponsivePadding(BuildContext context) {
    return ResponsivePadding.card(context);
  }

  double _getResponsiveBorderRadius(BuildContext context) {
    return ResponsiveSize.borderRadius(context, base: 24.0);
  }

  @override
  Widget build(BuildContext context) {
    final cardPadding = _getResponsivePadding(context);
    final borderRadius = _getResponsiveBorderRadius(context);
    final spacing = ResponsiveSize.spacing(context, base: 16.0);

    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _elevationAnimation.value),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: GlassmorphicContainer(
                blur: 25.0,
                opacity: 0.12,
                borderRadius: borderRadius,
                padding: EdgeInsets.all(cardPadding),
                border: true,
                borderWidth: 1.5,
                borderColor: _isHovered
                    ? AppColors.accent.withValues(alpha: 0.4)
                    : AppColors.glassBorder,
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? AppColors.primary.withValues(alpha: 0.3)
                        : AppColors.shadowMedium.withValues(alpha: 0.5),
                    blurRadius: _isHovered ? 48 : 24,
                    offset: Offset(0, _isHovered ? 24 : 12),
                    spreadRadius: _isHovered ? 4 : 0,
                  ),
                  if (_isHovered)
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.2),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                      spreadRadius: -4,
                    ),
                ],
                child: widget.isTablet
                    ? IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildProjectImage(borderRadius),
                            ),
                            SizedBox(width: spacing * 1.5),
                            Expanded(
                              flex: 3,
                              child: _buildProjectContent(spacing),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildProjectImage(borderRadius),
                          SizedBox(height: spacing * 1.5),
                          _buildProjectContent(spacing),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectImage(double borderRadius) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius * 0.67),
        child: AspectRatio(
          aspectRatio: widget.isTablet ? 1.6 : 1.5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background gradient placeholder
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              // Project image with parallax
              AnimatedBuilder(
                animation: _imageParallaxAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      _imageParallaxAnimation.value.dy * 100,
                    ),
                    child: Transform.scale(
                      scale: _isHovered ? 1.05 : 1.0,
                      child: CachedNetworkImage(
                        imageUrl: widget.project.imageUrl.isNotEmpty
                            ? widget.project.imageUrl
                            : '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 2.w,
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.textTertiary,
                            size: 48.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // Gradient overlay on hover
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _isHovered ? 1.0 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.5),
                        AppColors.accent.withValues(alpha: 0.2),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              // Shimmer effect on hover
              if (_isHovered)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: _isHovered ? 0.3 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          AppColors.textPrimary.withValues(alpha: 0.3),
                          Colors.transparent,
                        ],
                        begin: const Alignment(-1.0, -1.0),
                        end: const Alignment(1.0, 1.0),
                      ),
                    ),
                  ),
                ),
              // Icon-only links at top of image
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectContent(double spacing) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.project.name,
                  style: AppTextStyles.font24Bold(context).copyWith(
                    color: AppColors.textPrimary,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(width: spacing * 0.5),
              _buildIconLinks(),
            ],
          ),
          SizedBox(height: spacing * 0.75),
          Text(
            widget.project.description,
            style: AppTextStyles.font16Regular(context).copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
              letterSpacing: 0.2,
            ),
            maxLines: widget.isTablet ? 5 : 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildIconLinks() {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth < 600
        ? 18.0
        : screenWidth < 1024
            ? 20.0
            : 22.0;
    final spacing = ResponsiveSize.spacing(context, base: 8.0);

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.end,
      children: [
        if (widget.project.googlePlayUrl.isNotEmpty)
          _ProjectIconButton(
            url: widget.project.googlePlayUrl,
            icon: Icon(
              FontAwesomeIcons.googlePlay,
              color: AppColors.textPrimary,
              size: iconSize * 0.8,
            ),
          ),
        if (widget.project.appStoreUrl.isNotEmpty)
          _ProjectIconButton(
            url: widget.project.appStoreUrl,
            icon: Icon(
              FontAwesomeIcons.apple,
              color: AppColors.textPrimary,
              size: iconSize * 0.9,
            ),
          ),
        if (widget.project.downloadUrl.isNotEmpty)
          _ProjectIconButton(
            url: widget.project.downloadUrl,
            icon: SvgPicture.asset(
              Assets.svgsDownloadIcon,
              width: iconSize * 0.9,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        if (widget.project.githubUrl.isNotEmpty)
          _ProjectIconButton(
            url: widget.project.githubUrl,
            icon: SvgPicture.asset(
              Assets.svgsGithubIcon,
              width: iconSize * 0.9,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
        if (widget.project.promoUrl.isNotEmpty)
          _ProjectIconButton(
            url: widget.project.promoUrl,
            icon: SvgPicture.asset(
              Assets.svgsPlay,
              width: iconSize * 0.8,
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

class _ProjectIconButton extends StatefulWidget {
  final String url;
  final Widget icon;

  const _ProjectIconButton({
    required this.url,
    required this.icon,
  });

  @override
  State<_ProjectIconButton> createState() => _ProjectIconButtonState();
}

class _ProjectIconButtonState extends State<_ProjectIconButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: () => openUrl(widget.url),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: GlassmorphicContainer(
                blur: 15.0,
                opacity: _isHovered ? 0.25 : 0.15,
                borderRadius: 8.r,
                padding: EdgeInsets.all(8.w),
                border: true,
                borderWidth: 1.0,
                borderColor: _isHovered
                    ? AppColors.accent.withValues(alpha: 0.6)
                    : AppColors.glassBorder.withValues(alpha: 0.4),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? AppColors.accent.withValues(alpha: 0.3)
                        : AppColors.shadowMedium.withValues(alpha: 0.3),
                    blurRadius: _isHovered ? 12 : 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: widget.icon,
              ),
            );
          },
        ),
      ),
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

class _ProjectItemTextButtonState extends State<ProjectItemTextButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isPressed = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _iconBounceAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _iconBounceAnimation = Tween<double>(
      begin: 0.0,
      end: -2.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHoverEnter() {
    setState(() => _isHovered = true);
    _animationController.forward();
  }

  void _onHoverExit() {
    setState(() => _isHovered = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _isPressed ? 0.95 : _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: _isHovered
                    ? const LinearGradient(
                        colors: AppColors.accentGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [
                          AppColors.glassBorder.withValues(alpha: 0.15),
                          AppColors.glassBorder.withValues(alpha: 0.08),
                        ],
                      ),
                border: Border.all(
                  color: _isHovered
                      ? AppColors.accent.withValues(alpha: 0.6)
                      : AppColors.glassBorder,
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.accent.withValues(alpha: 0.4),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                          spreadRadius: 0,
                        ),
                        const BoxShadow(
                          color: AppColors.glowAccent,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async => await openUrl(widget.url),
                  onTapDown: (_) => setState(() => _isPressed = true),
                  onTapUp: (_) => setState(() => _isPressed = false),
                  onTapCancel: () => setState(() => _isPressed = false),
                  borderRadius: BorderRadius.circular(12.r),
                  splashColor: AppColors.accent.withValues(alpha: 0.2),
                  highlightColor: AppColors.accent.withValues(alpha: 0.1),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveSize.spacing(context, base: 16.0),
                      vertical: ResponsiveSize.spacing(context, base: 10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.translate(
                          offset: Offset(0, _iconBounceAnimation.value),
                          child: widget.icon,
                        ),
                        SizedBox(
                          width: ResponsiveSize.spacing(context, base: 8.0),
                        ),
                        DefaultTextStyle(
                          style: AppTextStyles.font14Medium(context).copyWith(
                            color: _isHovered
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                          child: widget.title,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
