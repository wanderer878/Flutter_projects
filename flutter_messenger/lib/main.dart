import 'package:flutter/material.dart';
import 'package:flutter_messenger/screens/conversations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: Theme.of(context).appBarTheme.copyWith(
                actionsIconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            inputDecorationTheme:
                InputDecorationTheme(prefixIconColor: Colors.grey)),
        debugShowCheckedModeBanner: false,
        home: Conversations());
  }
}
