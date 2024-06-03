import 'package:flutter/material.dart';
import 'package:patterns_codelab/data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Document_screen(
      document: Document(),
    ));
  }
}

class Document_screen extends StatelessWidget {
  final Document document;
  const Document_screen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    //final record = document.metadata; //using record
    final (title, modified: local_modified) = document.metadata;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //title: Text(record.$1), //if your're using record without pattern,
        title: Text(title),
      ),
      body: Column(
        children: [
          //Center(child: Text('Modified at ${record.modified}')), //if your're using record without pattern,
          Center(
            child: Text('Modified at ${local_modified}'),
          )
        ],
      ),
    );
  }
}
