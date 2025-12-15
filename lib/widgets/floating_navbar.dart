import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/services/resume_service.dart';

import 'glass_widgets.dart';

class FloatingNavbar extends StatefulWidget {
  final Map<String, GlobalKey> sectionKeys;
  final VoidCallback onThemeToggle;
  final bool isDark;

  const FloatingNavbar({
    super.key,
    required this.sectionKeys,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  State<FloatingNavbar> createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<FloatingNavbar> {
  bool _isMenuOpen = false;

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    if (_isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    if (!isSmallScreen && _isMenuOpen) {
      // Auto-close menu if resizing to desktop
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _isMenuOpen) setState(() => _isMenuOpen = false);
      });
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: GlassContainer(
              borderRadius: _isMenuOpen
                  ? BorderRadius.circular(24)
                  : BorderRadius.circular(100),
              color: widget.isDark ? Colors.black : Colors.white,
              opacity: widget.isDark ? 0.3 : 0.7,
              borderOpacity: 0.2,
              blur: 15,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Navbar Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      FutureBuilder(
                        future: ResumeService().getAbout(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(
                                        context,
                                      ).textTheme.titleLarge?.color ??
                                      (widget.isDark
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          }
                          return Text(
                            snapshot.data?.name
                                    .split(' ')
                                    .map(
                                      (word) => word.isNotEmpty ? word[0] : '',
                                    )
                                    .join() ??
                                'MI',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                          );
                        },
                      ),

                      if (isSmallScreen)
                        Row(
                          children: [
                            // Theme Toggle (Mobile)
                            IconButton(
                              icon: Icon(
                                widget.isDark
                                    ? Icons.light_mode_rounded
                                    : Icons.dark_mode_rounded,
                              ),
                              onPressed: widget.onThemeToggle,
                              tooltip: widget.isDark
                                  ? "Switch to Light Mode"
                                  : "Switch to Dark Mode",
                            ),
                            const SizedBox(width: 8),
                            // Menu Toggle
                            IconButton(
                              icon: Icon(
                                _isMenuOpen
                                    ? Icons.close_rounded
                                    : Icons.menu_rounded,
                              ),
                              onPressed: _toggleMenu,
                            ),
                          ],
                        )
                      else
                        // Desktop Menu
                        Row(
                          children: [
                            ...widget.sectionKeys.entries.map((entry) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: TextButton(
                                  onPressed: () =>
                                      _scrollToSection(entry.value),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color
                                        ?.withValues(alpha: 0.9),
                                  ),
                                  child: Text(entry.key),
                                ),
                              );
                            }),
                            const SizedBox(width: 8),
                            // Theme Toggle (Desktop)
                            IconButton(
                              icon: Icon(
                                widget.isDark
                                    ? Icons.light_mode_rounded
                                    : Icons.dark_mode_rounded,
                                size: 20,
                              ),
                              onPressed: widget.onThemeToggle,
                              style: IconButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.1),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                  // Mobile Dropdown Content
                  if (_isMenuOpen && isSmallScreen) ...[
                    const SizedBox(height: 16),
                    Divider(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.1),
                    ),
                    const SizedBox(height: 8),
                    ...widget.sectionKeys.entries.map((entry) {
                      return ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            _getIconForSection(entry.key),
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          entry.key,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.3),
                        ),
                        onTap: () => _scrollToSection(entry.value),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                      );
                    }),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: -1),
        ),
      ),
    );
  }

  IconData _getIconForSection(String section) {
    switch (section) {
      case 'About':
        return Icons.person_outline_rounded;
      case 'Skills':
        return Icons.code_rounded;
      case 'Experience':
        return Icons.work_outline_rounded;
      case 'Education':
        return Icons.school_outlined;
      case 'Projects':
        return Icons.dashboard_outlined;
      case 'Contact':
        return Icons.mail_outline_rounded;
      default:
        return Icons.circle_outlined;
    }
  }
}
