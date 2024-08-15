import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/custom_navigator.dart';

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
        themeMode: Provider.of<Blog_provider>(context).themeMode,
        home: CustomNavigator());
  }
}

({ThemeData light, ThemeData dark}) themes() {
  ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  );

  ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
  return (
    light: lightTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF007070), brightness: Brightness.light),
        textTheme:
            GoogleFonts.eduVicWaNtBeginnerTextTheme(lightTheme.textTheme)),
    dark: darkTheme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF007070), brightness: Brightness.dark),
        textTheme: GoogleFonts.eduVicWaNtBeginnerTextTheme(darkTheme.textTheme),
        )
  );
}
