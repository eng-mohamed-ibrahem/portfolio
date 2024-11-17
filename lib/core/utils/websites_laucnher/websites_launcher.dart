import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsitesLauncher {
  static void launchWebsite(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
