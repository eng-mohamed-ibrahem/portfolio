import 'dart:ui';

import 'package:flutter/material.dart';

import 'models/resume_model.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'services/resume_service.dart';
import 'theme/app_theme.dart';
import 'widgets/floating_navbar.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, child) {
        return MaterialApp(
          title: 'Mohamed Ibrahem',
          debugShowCheckedModeBanner: false,
          themeAnimationCurve: Curves.bounceInOut,
          themeAnimationDuration: const Duration(milliseconds: 500),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: const PortfolioHome(),
        );
      },
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  late Future<ResumeModel> _resumeFuture;
  final ResumeService _resumeService = ResumeService();

  final Map<String, GlobalKey> _sectionKeys = {
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Experience': GlobalKey(),
    'Education': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _resumeFuture = _resumeService.getResume();
  }

  void _toggleTheme() {
    themeNotifier.value = themeNotifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // No standard AppBar, we use FloatingNavbar
      body: Stack(
        children: [
          // Ambient Background
          const Positioned.fill(child: _AmbientBackground()),

          // Main Content
          FutureBuilder<ResumeModel>(
            future: _resumeFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error loading portfolio.\n${snapshot.error}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else if (!snapshot.hasData) {
                return const Center(child: Text("No data found"));
              }

              final resume = snapshot.data!;
              return CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  HeroSection(
                    key: _sectionKeys['About'],
                    about: resume.about,
                    contact: resume.contact,
                  ),
                  SkillsSection(
                    key: _sectionKeys['Skills'],
                    technicalSkills: resume.technicalSkills,
                    softSkills: resume.softSkills,
                  ),
                  ExperienceSection(
                    key: _sectionKeys['Experience'],
                    experience: resume.experience,
                  ),
                  EducationSection(
                    key: _sectionKeys['Education'],
                    education: resume.education,
                  ),
                  ProjectsSection(
                    key: _sectionKeys['Projects'],
                    projects: resume.projects,
                  ),
                  ContactSection(
                    key: _sectionKeys['Contact'],
                    contact: resume.contact,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  // Footer
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Center(
                        child: Text(
                          "© ${DateTime.now().year} ${resume.about.name}. Built with Flutter",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color
                                    ?.withValues(alpha: 0.6),
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Floating Navbar (Pinned at top)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: FloatingNavbar(
              sectionKeys: _sectionKeys,
              onThemeToggle: _toggleTheme,
              isDark: Theme.of(context).brightness == Brightness.dark,
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? AppTheme.darkBackgroundGradient
            : AppTheme.lightBackgroundGradient,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use simpler blur on mobile for performance
          final isMobile = constraints.maxWidth < 800;
          final blurValue = isMobile ? 20.0 : 80.0;

          return Stack(
            children: [
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(
                      0xFF4A90E2,
                    ).withValues(alpha: 0.2), // Blue
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(
                      0xFF8B5CF6,
                    ).withValues(alpha: 0.2), // Purple
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(
                      0xFF14B8A6,
                    ).withValues(alpha: 0.1), // Teal
                  ),
                ),
              ),
              // Blur overlay
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                child: Container(color: Colors.transparent),
              ),
            ],
          );
        },
      ),
    );
  }
}
