import 'package:flutter/material.dart';
import 'package:naviagtion_cookbooks/screens/hero-animations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Main_Page(),
      ),
    );
  }
}

class Main_Page extends StatelessWidget {
  const Main_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => hero_animations())),
              child: Text('Hero animations'))
        ],
      ),
    );
  }
}
