import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp.router(
    routerConfig: router,
  ));
}

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const MainApp(), routes: [
    GoRoute(path: 'details', builder: (context, state) => const Details())
  ]),
]);

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

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('details page')],
        ),
      ),
    );
  }
}
