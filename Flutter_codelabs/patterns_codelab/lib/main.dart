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
    final Modified = FormatDate(local_modified);
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
            child: Text('Modified ${Modified}'),
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

  return switch (difference) {
    //this is a switch expression
    Duration(inDays: 1) => 'Tommorow',
    Duration(inDays: 0) => 'Today',
    Duration(inDays: -1) => 'Yesterday',
    Duration(inDays: final days, isNegative: true) when days.abs() > 7 =>
      '${days.abs() ~/ 7} weeks ago',
    Duration(inDays: final days, isNegative: false) when days > 7 =>
      '${days.abs() ~/ 7} weeks from now',
    Duration(inDays: final days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: final days, isNegative: false) => '$days days after',
  };
}
