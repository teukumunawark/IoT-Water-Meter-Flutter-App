import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final TextStyle kHeading2 = GoogleFonts.poppins(
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading3 = GoogleFonts.poppins(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
final TextStyle kHeading4 = GoogleFonts.poppins(
  fontSize: 26,
  fontWeight: FontWeight.w600,
);
final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 23,
  fontWeight: FontWeight.w400,
);
final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);
final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final kTextTheme = TextTheme(
  displayMedium: kHeading2,
  displaySmall: kHeading3,
  headlineMedium: kHeading4,
  headlineSmall: kHeading5,
  titleLarge: kHeading6,
  titleMedium: kSubtitle,
  bodyMedium: kBodyText,
);

// Initialize color scheme using a base color as a reference
final kColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors
      .contentColorGreen, // Reference color used to create the color scheme
  primary: AppColors.contentColorGreen, // Main color in the color scheme
  primaryContainer:
      AppColors.contentColorGreen, // Background color for primary elements
  secondary: AppColors.secondary, // Secondary color in the color scheme
  secondaryContainer:
      AppColors.secondary, // Background color for secondary elements
  surface: AppColors.contentColorWhite, // Surface color in the color scheme
  background:
      AppColors.contentColorWhite, // Background color in the color scheme
  error: Colors.red, // Color indicating error conditions
  onPrimary: AppColors
      .itemsBackground, // Text color corresponding to the primary color
  onSecondary:
      AppColors.secondary, // Text color corresponding to the secondary color
  onSurface:
      AppColors.secondary, // Text color corresponding to the surface color
  onBackground: AppColors
      .contentColorWhite, // Text color corresponding to the background color
  onError: Colors.red, // Text color corresponding to the error color
  brightness: Brightness.light, // Light mode brightness
);
