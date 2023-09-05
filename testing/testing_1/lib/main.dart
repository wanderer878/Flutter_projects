import 'package:flutter/material.dart';
import 'package:testing_1/Fetch_album.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Main_w(),
      ),
    );
  }
}

class Main_w extends StatelessWidget {
  const Main_w({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Fetch_album()));
              },
              child: Text("Mockito Testing"))
        ],
      ),
    );
  }
}
