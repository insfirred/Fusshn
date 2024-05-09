import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF111111),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),

    displayMedium: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontWeight: FontWeight.w700,
      fontSize: 28,
    ),

    displaySmall: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),

    titleMedium: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),

    bodyMedium: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),

    bodySmall: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontSize: 14,
    ),

    // button text
    labelMedium: GoogleFonts.poppins(
      color: const Color(0xFFF1F1F1),
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
  ),
);
