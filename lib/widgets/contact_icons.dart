import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// A comprehensive mapping of contact/social data types to their corresponding icons
/// Following senior UX principles for instant visual recognition
class ContactIconMapper {
  // Private constructor to prevent instantiation
  ContactIconMapper._();

  /// Returns the appropriate FontAwesome icon for a given contact type
  /// Uses brand-specific icons for better visual recognition
  static IconData getIconForContactType(ContactType type) {
    switch (type) {
      case ContactType.email:
        return FontAwesomeIcons.envelope;
      case ContactType.phone:
        return FontAwesomeIcons.phone;
      case ContactType.github:
        return FontAwesomeIcons.github;
      case ContactType.linkedin:
        return FontAwesomeIcons.linkedin;
      case ContactType.website:
        return FontAwesomeIcons.globe;
      case ContactType.location:
        return FontAwesomeIcons.locationDot;
      case ContactType.twitter:
        return FontAwesomeIcons.twitter;
      case ContactType.instagram:
        return FontAwesomeIcons.instagram;
      case ContactType.facebook:
        return FontAwesomeIcons.facebook;
      case ContactType.youtube:
        return FontAwesomeIcons.youtube;
      case ContactType.telegram:
        return FontAwesomeIcons.telegram;
      case ContactType.whatsapp:
        return FontAwesomeIcons.whatsapp;
    }
  }

  /// Returns a user-friendly label for the contact type
  static String getLabelForContactType(ContactType type) {
    switch (type) {
      case ContactType.email:
        return 'Email';
      case ContactType.phone:
        return 'Phone';
      case ContactType.github:
        return 'GitHub';
      case ContactType.linkedin:
        return 'LinkedIn';
      case ContactType.website:
        return 'Website';
      case ContactType.location:
        return 'Location';
      case ContactType.twitter:
        return 'Twitter';
      case ContactType.instagram:
        return 'Instagram';
      case ContactType.facebook:
        return 'Facebook';
      case ContactType.youtube:
        return 'YouTube';
      case ContactType.telegram:
        return 'Telegram';
      case ContactType.whatsapp:
        return 'WhatsApp';
    }
  }

  /// Returns the brand color for the contact type
  /// Useful for themed buttons or hover states
  static Color getBrandColorForContactType(ContactType type) {
    switch (type) {
      case ContactType.email:
        return const Color(0xFFEA4335); // Gmail red
      case ContactType.phone:
        return const Color(0xFF34C759); // Green
      case ContactType.github:
        return const Color(0xFF181717); // GitHub black
      case ContactType.linkedin:
        return const Color(0xFF0A66C2); // LinkedIn blue
      case ContactType.website:
        return const Color(0xFF5B7FFF); // Web blue
      case ContactType.location:
        return const Color(0xFFEA4335); // Maps red
      case ContactType.twitter:
        return const Color(0xFF1DA1F2); // Twitter blue
      case ContactType.instagram:
        return const Color(0xFFE4405F); // Instagram pink
      case ContactType.facebook:
        return const Color(0xFF1877F2); // Facebook blue
      case ContactType.youtube:
        return const Color(0xFFFF0000); // YouTube red
      case ContactType.telegram:
        return const Color(0xFF0088CC); // Telegram blue
      case ContactType.whatsapp:
        return const Color(0xFF25D366); // WhatsApp green
    }
  }
}

/// Enum representing different contact types
enum ContactType {
  email,
  phone,
  github,
  linkedin,
  website,
  location,
  twitter,
  instagram,
  facebook,
  youtube,
  telegram,
  whatsapp,
}

/// A beautifully designed social/contact button with proper UX principles
/// Features: hover effects, accessibility, visual feedback, and brand recognition
class SocialContactButton extends StatefulWidget {
  final ContactType type;
  final String? url;
  final VoidCallback? onPressed;
  final double size;
  final bool showLabel;
  final bool useGlassEffect;
  final bool useBrandColor;

  const SocialContactButton({
    super.key,
    required this.type,
    this.url,
    this.onPressed,
    this.size = 48,
    this.showLabel = false,
    this.useGlassEffect = true,
    this.useBrandColor = false,
  });

  @override
  State<SocialContactButton> createState() => _SocialContactButtonState();
}

class _SocialContactButtonState extends State<SocialContactButton>
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
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = ContactIconMapper.getIconForContactType(widget.type);
    final label = ContactIconMapper.getLabelForContactType(widget.type);
    final brandColor = ContactIconMapper.getBrandColorForContactType(
      widget.type,
    );

    final effectiveColor = widget.useBrandColor
        ? brandColor
        : Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white;

    if (widget.url == null && widget.onPressed == null) {
      return const SizedBox.shrink();
    }

    final button = MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      cursor: SystemMouseCursors.click,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.useBrandColor
                      ? brandColor.withValues(alpha: 0.15)
                      : Colors.white.withValues(alpha: 0.1))
                : (widget.useGlassEffect
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.transparent),
            border: Border.all(
              color: _isHovered
                  ? (widget.useBrandColor
                        ? brandColor.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.3))
                  : Colors.white.withValues(alpha: 0.15),
              width: _isHovered ? 2 : 1.5,
            ),
            shape: BoxShape.circle,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: (widget.useBrandColor ? brandColor : Colors.white)
                          .withValues(alpha: 0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: IconButton(
            onPressed: widget.onPressed,
            icon: FaIcon(
              icon,
              color: _isHovered
                  ? (widget.useBrandColor ? brandColor : Colors.white)
                  : effectiveColor.withValues(alpha: 0.8),
              size: widget.size * 0.42,
            ),
            tooltip: widget.url ?? label,
            padding: EdgeInsets.zero,
            splashRadius: widget.size / 2,
          ),
        ),
      ),
    );

    if (widget.showLabel) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          button,
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return button;
  }
}

/// A row of social contact buttons with responsive spacing
class SocialContactRow extends StatelessWidget {
  final Map<ContactType, String?> contacts;
  final double buttonSize;
  final bool showLabels;
  final bool useGlassEffect;
  final bool useBrandColors;
  final MainAxisAlignment alignment;
  final double spacing;

  const SocialContactRow({
    super.key,
    required this.contacts,
    this.buttonSize = 48,
    this.showLabels = false,
    this.useGlassEffect = true,
    this.useBrandColors = false,
    this.alignment = MainAxisAlignment.center,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    final availableContacts = contacts.entries
        .where((entry) => entry.value != null && entry.value!.isNotEmpty)
        .toList();

    if (availableContacts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: _getWrapAlignment(),
      children: availableContacts.map((entry) {
        return SocialContactButton(
          type: entry.key,
          url: entry.value,
          size: buttonSize,
          showLabel: showLabels,
          useGlassEffect: useGlassEffect,
          useBrandColor: useBrandColors,
          onPressed: () {
            launchUrl(Uri.parse(entry.value!));
          },
        );
      }).toList(),
    );
  }

  WrapAlignment _getWrapAlignment() {
    return switch (alignment) {
      MainAxisAlignment.start => WrapAlignment.start,
      MainAxisAlignment.end => WrapAlignment.end,
      MainAxisAlignment.spaceBetween => WrapAlignment.spaceBetween,
      MainAxisAlignment.spaceAround => WrapAlignment.spaceAround,
      MainAxisAlignment.spaceEvenly => WrapAlignment.spaceEvenly,
      MainAxisAlignment.center => WrapAlignment.center,
    };
  }
}
