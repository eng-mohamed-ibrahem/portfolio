import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme _googleTextTheme = GoogleFonts.outfitTextTheme();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: const Color(0xFFF0F4FA), // Light cool grey-blue
    useMaterial3: true,
    textTheme: _googleTextTheme.apply(
      bodyColor: const Color(0xFF1A1A2E),
      displayColor: const Color(0xFF1A1A2E),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF50E3C2),
      surface: Color(
        0xCCFFFFFF,
      ), // More opaque white (80%) for better visibility
      onSurface: Color(0xFF1A1A2E), // Dark text on surface
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: const Color(0xFF0F0F1A), // Deep dark blue
    useMaterial3: true,
    textTheme: _googleTextTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4A90E2),
      secondary: Color(0xFF50E3C2),
      surface: Colors.black26, // Glassy surface base
    ),
  );

  // Gradient Backgrounds
  static const LinearGradient lightBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
  );

  static const LinearGradient darkBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
  );
}
