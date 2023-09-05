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
        body: Center(
          child: Column(
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
        ),
      ),
    );
  }
}
