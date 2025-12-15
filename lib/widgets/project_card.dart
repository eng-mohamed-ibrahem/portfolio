import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    _controller.reverse();
  }

  void _onTap() {
    // Treat tap like hover for the local animation (visual feedback)
    _controller.forward().then((_) => _controller.reverse());
    // Open full details
    _showDetailsDialog(context);
  }

  Future<void> _launchURL(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $uri');
    }
  }

  void _showDetailsDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Project Details',
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: _ProjectDetailsDialog(
              project: widget.project,
              onLaunchUrl: _launchURL,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // 1. Background Image with Zoom Effect
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_animation.value * 0.1), // 10% zoom on hover
                    child: child,
                  );
                },
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: widget.project.imageUrl.isNotEmpty
                      ? Image.network(
                          widget.project.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholder(theme),
                        )
                      : _buildPlaceholder(theme),
                ),
              ),

              // 2. Dark Gradient Overlay (Always present for text readability)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(
                            alpha: 0.6 + (_animation.value * 0.3),
                          ),
                        ],
                        stops: const [0.0, 0.9],
                      ),
                    ),
                  );
                },
              ),

              // 3. Content Layout (Compact View)
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Year
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              widget.project.name,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.project.googlePlayUrl.isNotEmpty)
                                _buildIconLink(
                                  FontAwesomeIcons.googlePlay,
                                  widget.project.googlePlayUrl,
                                ),
                              if (widget.project.appStoreUrl.isNotEmpty)
                                _buildIconLink(
                                  FontAwesomeIcons.appStore,
                                  widget.project.appStoreUrl,
                                ),
                              if (widget.project.githubUrl.isNotEmpty)
                                _buildIconLink(
                                  FontAwesomeIcons.github,
                                  widget.project.githubUrl,
                                ),
                              if (widget.project.promoUrl.isNotEmpty)
                                _buildIconLink(
                                  FontAwesomeIcons.video,
                                  widget.project.promoUrl,
                                ),
                            ],
                          ),
                        ],
                      ),

                      // Animated Details Section (Slide Up on Hover/Tap)
                      SizeTransition(
                        sizeFactor: _animation,
                        axisAlignment: -1.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            // Compact Description
                            Text(
                              widget.project.description,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                                height: 1.4,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 16),
                            // Hint to tap for more
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  "Tap for details",
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white.withValues(alpha: 0.6),
                                  size: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconLink(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _launchURL(url),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: FaIcon(icon, color: Colors.white, size: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(ThemeData theme) {
    return Container(
      color: const Color(0xFF1E1E1E),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.code,
          color: Colors.white.withValues(alpha: 0.2),
          size: 40,
        ),
      ),
    );
  }
}

class _ProjectDetailsDialog extends StatelessWidget {
  final ProjectModel project;
  final Function(String) onLaunchUrl;

  const _ProjectDetailsDialog({
    required this.project,
    required this.onLaunchUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        // Responsive Dimensions
        final isMobile = screenWidth < 600;
        final isLandscapeMobile = screenHeight < 500;

        // Calculate Width & Height
        final dialogWidth = screenWidth > 900 ? 900.0 : screenWidth * 0.95;
        final dialogHeight = screenHeight * (isMobile ? 0.95 : 0.85);

        // Dynamic Image Height (smaller on mobile/landscape to save space)
        final imageHeight = isLandscapeMobile
            ? 120.0
            : (isMobile ? 180.0 : 250.0);

        return Container(
          width: dialogWidth,
          height: dialogHeight,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 30,
                spreadRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Column(
              children: [
                // Header Image
                SizedBox(
                  height: imageHeight,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      project.imageUrl.isNotEmpty
                          ? Image.network(project.imageUrl, fit: BoxFit.cover)
                          : Container(
                              color: theme.colorScheme.surfaceContainerHighest,
                            ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              (isDark ? const Color(0xFF1A1A1A) : Colors.white)
                                  .withValues(alpha: 1.0),
                            ],
                            stops: const [0.6, 1.0],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close, color: Colors.white),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 32,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                project.name,
                                style:
                                    (isMobile
                                            ? theme.textTheme.headlineSmall
                                            : theme.textTheme.headlineMedium)
                                        ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${project.createdAt.year}",
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Full Description
                        Text(
                          "About the project",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project.description,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            height: 1.6,
                            color: isDark ? Colors.grey[300] : Colors.grey[800],
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Action Buttons (Full width on mobile, row on desktop)
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            if (project.githubUrl.isNotEmpty)
                              _buildActionButton(
                                context,
                                FontAwesomeIcons.github,
                                "View Source",
                                project.githubUrl,
                                isMobile,
                              ),
                            if (project.promoUrl.isNotEmpty)
                              _buildActionButton(
                                context,
                                FontAwesomeIcons.globe,
                                "Visit Website",
                                project.promoUrl,
                                isMobile,
                              ),
                            if (project.downloadUrl.isNotEmpty &&
                                project.downloadUrl != project.promoUrl)
                              _buildActionButton(
                                context,
                                FontAwesomeIcons.download,
                                "Download App",
                                project.downloadUrl,
                                isMobile,
                              ),
                            if (project.googlePlayUrl.isNotEmpty)
                              _buildActionButton(
                                context,
                                FontAwesomeIcons.googlePlay,
                                "Google Play",
                                project.googlePlayUrl,
                                isMobile,
                              ),
                            if (project.appStoreUrl.isNotEmpty)
                              _buildActionButton(
                                context,
                                FontAwesomeIcons.appStore,
                                "App Store",
                                project.appStoreUrl,
                                isMobile,
                              ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animate().fadeIn().scale(duration: 300.ms, curve: Curves.easeOutBack);
      },
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    String url,
    bool isMobile,
  ) {
    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: () => onLaunchUrl(url),
        icon: FaIcon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
