import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  ThemeData baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF067AEF)),
      //primaryColor: Colors.green,
      textTheme: TextTheme(displayLarge: TextStyle(color: Colors.green)));

  return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoMonoTextTheme(baseTheme.textTheme));
}
