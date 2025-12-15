import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/resume_model.dart';
import '../widgets/glass_widgets.dart';

class ContactSection extends StatelessWidget {
  final ContactData contact;

  const ContactSection({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Center(
          child: GlassContainer(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            borderRadius: BorderRadius.circular(30),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  const SectionTitle(title: "Get In Touch"),
                  Text(
                    "I'm currently looking for new opportunities. Whether you have a work opportunity or just want to say hi, I'll try my best to get back to you!",
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      launchUrl(Uri.parse('mailto:${contact.email}'));
                    },
                    icon: const FaIcon(FontAwesomeIcons.envelope),
                    label: const Text("Say Hello"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (contact.github != null)
                        _SocialButton(
                          icon: FontAwesomeIcons.github,
                          url: contact.github!,
                        ),
                      if (contact.linkedin != null)
                        _SocialButton(
                          icon: FontAwesomeIcons.linkedin,
                          url: contact.linkedin!,
                        ),
                      if (contact.phone != null)
                        _SocialButton(
                          icon: FontAwesomeIcons.phone,
                          url: 'tel:${contact.phone}',
                        ),
                    ],
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

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialButton({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: IconButton(
        icon: FaIcon(icon, size: 28),
        onPressed: () => launchUrl(Uri.parse(url)),
        color: Theme.of(context).textTheme.bodyLarge?.color,
        tooltip: url,
      ),
    );
  }
}
