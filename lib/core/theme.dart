import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryPurple = Color(0xFF8A2BE2);
  static const Color accentPink = Color(0xFFFF69B4);
  static const Color brightYellow = Color(0xFFFFD700);
  static const Color softGreen = Color(0xFF98FB98);
  static const Color backgroundLight = Color(0xFFF0F8FF);
  static const Color textDark = Color(0xFF333333);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryPurple,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        secondary: accentPink,
        tertiary: brightYellow,
      ),
      textTheme: GoogleFonts.nunitoTextTheme().apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primaryPurple),
        titleTextStyle: TextStyle(
          color: primaryPurple,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
      ),
    );
  }
}
