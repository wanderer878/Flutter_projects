import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/custom_navigator.dart';

ThemeMode themeMode = ThemeMode.system;

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Blog_provider(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themes().light,
        darkTheme: themes().dark,
        themeMode: themeMode,
        home: CustomNavigator(
          changeTheme: changeTheme,
        ));
  }
}

({ThemeData light, ThemeData dark}) themes() {
  ThemeData lightTheme = ThemeData.light();

  ThemeData darkTheme = ThemeData.dark();

  return (
    light: lightTheme.copyWith(
        textTheme:
            GoogleFonts.eduVicWaNtBeginnerTextTheme(lightTheme.textTheme)),
    dark: darkTheme.copyWith(
        textTheme: GoogleFonts.eduVicWaNtBeginnerTextTheme(darkTheme.textTheme))
  );
}

ThemeMode changeTheme() {
  return ThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}
