import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  String _platform() {
    if (kIsWeb)
      return 'Web';
    else if (Platform.isWindows)
      return 'windows';
    else if (Platform.isIOS)
      return 'IOS';
    else if (Platform.isAndroid)
      return 'android';
    else if (Platform.isLinux)
      return 'linux';
    else
      return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('dart io: ${_platform()}'),
              SizedBox(
                height: 20,
              ),
              Text('theme platform: ${Theme.of(context).platform}')
            ],
          ),
        ),
      ),
    );
  }
}
