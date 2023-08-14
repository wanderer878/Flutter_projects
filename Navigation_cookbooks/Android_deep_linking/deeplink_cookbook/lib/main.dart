import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp.router(
    routerConfig: router,
  ));
}

final router = GoRouter(
    routes: [GoRoute(path: '/', builder: (context, state) => const MainApp())]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Main Screen"),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
