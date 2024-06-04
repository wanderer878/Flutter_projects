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
    final blockList = document.getBlocks();
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
          ),
          Expanded(
            child: ListView.builder(
                itemCount: blockList.length,
                itemBuilder: (context, index) {
                  return Block_widget(
                    Block: blockList[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Block_widget extends StatelessWidget {
  final Block;
  const Block_widget({super.key, this.Block});
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;

    textStyle = switch (Block.type) {
      'h1' => Theme.of(context).textTheme.displayMedium,
      'p' || 'checkbox' => Theme.of(context).textTheme.bodyMedium,
      _ => Theme.of(context).textTheme.bodySmall
    };

    return Container(
      margin: EdgeInsets.all(8.0),
      child: Text(style: textStyle, Block.text),
    );
  }
}

String FormatDate(DateTime dateTime) {
  final difference = dateTime.difference(DateTime.now());

  switch (difference) {
    case Duration(inDays: 1):
      return 'Tommorow';
    case Duration(inDays: 0):
      return 'Today';
    case Duration(inDays: -1):
      return 'Yesterday';
    case Duration(inDays: final days, isNegative: true):
      return '${days.abs()} days ago';
    case Duration(inDays: final days, isNegative: false):
      return '$days days after';
  }

  return 'hello'; //delete krdena bhai
}
