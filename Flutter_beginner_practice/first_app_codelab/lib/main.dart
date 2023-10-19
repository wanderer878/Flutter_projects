import 'package:first_app_codelab/Favorites.dart';
import 'package:first_app_codelab/screens/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Favourites(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ThemeData base = ThemeData.light(useMaterial3: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: base.copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown).copyWith(
              background: Colors.brown.shade100,
              onPrimaryContainer: Colors.white),
          cardTheme: CardTheme(color: Colors.brown[600]),
          textTheme: TextTheme(
              displayMedium: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(color: Colors.brown)),
        ),
        home: HomePage());
  }
}
