import 'package:flutter/material.dart';
import 'package:naviagtion_cookbooks/screens/Return_data.dart';
import 'package:naviagtion_cookbooks/screens/Todo.dart';
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

class Main_Page extends StatefulWidget {
  const Main_Page({
    super.key,
  });

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => hero_animations())),
              child: Text('Hero animations')),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => _navigateAndDisplaySelection(context, mounted),
              child: Text('Selection Screen')),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Todo())),
              child: Text('Todo Screen'))
        ],
      ),
    );
  }
}

Future<void> _navigateAndDisplaySelection(BuildContext context, mounted) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const return_data()),
  );

  // When a BuildContext is used from a StatefulWidget, the mounted property
  // must be checked after an asynchronous gap.
  if (!mounted) return;

  // After the Selection Screen returns a result, hide any previous snackbars
  // and show the new result.
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}
