import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Album {
  int userId, id;
  String title;
  Album({required this.userId, required this.title, required this.id});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Default App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Default App'),
      ),
      body: Center(
        child: Text(
          'Welcome to Flutter!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
