import 'dart:math' as math;

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/resume_model.dart';
import '../widgets/contact_icons.dart';
import '../widgets/glass_widgets.dart';

class HeroSection extends StatelessWidget {
  final AboutData about;
  final ContactData contact;

  const HeroSection({super.key, required this.about, required this.contact});

  @override
  Widget build(BuildContext context) {
    // "grid-cols-1 md:grid-cols-12" -> LayoutBuilder or simple wrap
    // We'll use a Wrap or Flex based on width.
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
          top: 120,
          bottom: 80,
          left: 24,
          right: 24,
        ), // top padding for navbar
        constraints: const BoxConstraints(minHeight: 800), // Min height screen
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              return Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left Column (Text)
                  if (isDesktop)
                    Expanded(
                      flex: 7,
                      child: _buildLeftColumn(context, isDesktop),
                    )
                  else
                    _buildLeftColumn(context, isDesktop),

                  if (!isDesktop) const SizedBox(height: 48),

                  // Right Column (Glass Card)
                  if (isDesktop)
                    Expanded(
                      flex: 5,
                      child: _buildRightColumn(context, isDesktop),
                    )
                  else
                    _buildRightColumn(context, isDesktop),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLeftColumn(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            "Welcome to my portfolio",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ).animate().fadeIn().slideY(begin: 0.2),

        const SizedBox(height: 24),

        // H1 Headline
        Text(
          "Hi, I'm",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.1,
            fontSize: isDesktop ? 64 : 48,
          ),
        ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2),

        // Gradient Name
        GradientText(
          about.name,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.1,
            fontSize: isDesktop ? 64 : 48,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF67E8F9),
              Color(0xFFC084FC),
            ], // Cyan-300 to Purple-400
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),

        const SizedBox(height: 16),

        // Title
        Text(
          about.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w300,
          ),
        ).animate().fadeIn(delay: 300.ms),

        const SizedBox(height: 16),

        Text(
          about.summary,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.7),
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 400.ms),

        const SizedBox(height: 32),

        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            // Contact Me Button
            ElevatedButton.icon(
              onPressed: () {
                launchUrl(Uri.parse("mailto:${contact.email}"));
              },
              icon: const Icon(Icons.email_outlined, size: 18),
              label: const Text("Contact Me"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1E3A8A), // Blue 900
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                elevation: 8,
                shadowColor: const Color(0xFF1E3A8A).withValues(alpha: 0.2),
                shape: const StadiumBorder(),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            // Download CV Button
            OutlinedButton.icon(
              onPressed: () async {
                if (about.resumeUrl != null) {
                  try {
                    await FileSaver.instance.saveFile(
                      name: about.resumeUrl!.split('/').last,
                      link: LinkDetails(link: about.resumeUrl!),
                      mimeType: MimeType.pdf,
                    );
                  } catch (e, stackTrace) {
                    await Sentry.captureException(e, stackTrace: stackTrace);
                  }
                }
              },
              icon: const Icon(Icons.download_rounded, size: 18),
              label: const Text("Download CV"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.2)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                backgroundColor: Colors.white.withValues(alpha: 0.05),
                shape: const StadiumBorder(),
                textStyle: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
      ],
    );
  }

  Widget _buildRightColumn(BuildContext context, bool isDesktop) {
    return Center(
      // Center within the flex column
      child: Transform.rotate(
        angle: isDesktop ? 3 * math.pi / 180 : 0, // Rotate 3 deg on desktop
        child: GlassContainer(
          padding: const EdgeInsets.all(32),
          color: Colors.white.withValues(alpha: 0.03),
          borderOpacity: 0.15,
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar with gradient border
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF60A5FA), // Blue
                      Color(0xFF8B5CF6), // Purple
                      Color(0xFFC084FC), // Light Purple
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: 72,
                  backgroundColor: const Color(0xFF0F172A),
                  backgroundImage: about.profileImageUrl != null
                      ? NetworkImage(about.profileImageUrl!)
                      : null,
                  child: about.profileImageUrl == null
                      ? const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white54,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                about.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Based in ${contact.location}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 24),
              // Social Icons Row with enhanced UX
              SocialContactRow(
                contacts: {
                  ContactType.github: contact.github,
                  ContactType.linkedin: contact.linkedin,
                  ContactType.email: "mailto:${contact.email}",
                  if (contact.phone != null)
                    ContactType.phone: "tel:${contact.phone}",
                },
                buttonSize: 48,
                useGlassEffect: true,
                useBrandColors: false,
                spacing: 12,
              ),
            ],
          ),
        ).animate().fadeIn(delay: 500.ms).scale(),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
