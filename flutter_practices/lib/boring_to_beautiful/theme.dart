import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PageTransitionsTheme pageTransitionsTheme =
    PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
});

ThemeData themeData() {
  ThemeData baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Color(
              0xFF067AEF)), // brightness: Brightness.light batana zroori hai warna color.fromseed diferentiate nhi krta
      //primaryColor: Colors.green,
      pageTransitionsTheme: pageTransitionsTheme,
      useMaterial3: true,
      textTheme: TextTheme(displayLarge: TextStyle(color: Colors.green)));

  return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoMonoTextTheme(baseTheme.textTheme));
}

ThemeMode theme_Mode = ThemeMode.system;

ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: Color(0xFF067AEF)),
  pageTransitionsTheme: pageTransitionsTheme,
);
