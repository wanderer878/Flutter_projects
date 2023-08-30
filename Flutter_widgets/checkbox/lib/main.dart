import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Checkbox is $_isChecked',
                style: TextStyle(
                    decoration: _isChecked == false
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
