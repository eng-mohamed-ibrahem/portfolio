import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Gradient Colors - Deep Purple to Violet
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color secondary = Color(0xFF8B5CF6); // Purple
  static const Color secondaryDark = Color(0xFF7C3AED);
  static const Color secondaryLight = Color(0xFFA78BFA);

  // Accent Colors - Cyan & Teal
  static const Color accent = Color(0xFF06B6D4); // Cyan
  static const Color accentDark = Color(0xFF0891B2);
  static const Color accentLight = Color(0xFF22D3EE);
  static const Color teal = Color(0xFF14B8A6);
  static const Color tealDark = Color(0xFF0D9488);
  static const Color tealLight = Color(0xFF2DD4BF);

  // Background Colors
  static const Color background = Color(0xFF0F172A); // Dark slate
  static const Color backgroundLight = Color(0xFF1E293B);
  static const Color backgroundDark = Color(0xFF020617);
  static const Color surface = Color(0xFF1E293B);
  static const Color surfaceLight = Color(0xFF334155);

  // Glassmorphism Colors
  static const Color glassBackground = Color(0x1AFFFFFF); // 10% white
  static const Color glassBorder = Color(0x33FFFFFF); // 20% white
  static const Color glassHover = Color(0x26FFFFFF); // 15% white
  static const Color glassOverlay = Color(0x0DFFFFFF); // 5% white

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC); // Almost white
  static const Color textSecondary = Color(0xFFCBD5E1); // Light gray
  static const Color textTertiary = Color(0xFF94A3B8); // Medium gray
  static const Color textMuted = Color(0xFF64748B); // Muted gray

  // Gradient Colors (for LinearGradient usage)
  static const List<Color> primaryGradient = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Purple
  ];

  static const List<Color> accentGradient = [
    Color(0xFF06B6D4), // Cyan
    Color(0xFF14B8A6), // Teal
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFF0F172A), // Dark slate
    Color(0xFF1E293B), // Lighter slate
    Color(0xFF0F172A), // Dark slate
  ];

  static const List<Color> heroGradient = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Purple
    Color(0xFF06B6D4), // Cyan
  ];

  // Success, Warning, Error
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Shadow Colors
  static const Color shadowLight = Color(0x0A000000);
  static const Color shadowMedium = Color(0x1A000000);
  static const Color shadowHeavy = Color(0x3D000000);

  // Glow Effects
  static const Color glowPrimary = Color(0x4D6366F1);
  static const Color glowAccent = Color(0x4D06B6D4);
  static const Color glowSecondary = Color(0x4D8B5CF6);

  // Legacy colors (keeping for backward compatibility during migration)
  static const Color primaryColor = background;
  static const Color color6971A2 = Color(0xff6971A2);
  static const Color colorC1C2D3 = Color(0xffC1C2D3);
  static const Color colorCBACF9 = Color(0xffCBACF9);
  static const Color colorE4ECFF = Color(0xffE4ECFF);
  static const Color color06091F = Color(0xff06091F);
  static const Color color04071D = Color(0xff04071D);
  static const Color color0C0E23 = Color(0xff0C0E23);
  static const Color colorBEC1DD = Color(0xffBEC1DD);
}
