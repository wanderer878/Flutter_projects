import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('widget test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NewWidget(),
            Test_widget1(title: "StarField", message: "Such a great game"),
            Test_widget2()
          ],
        ),
      ),
    ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Widget 1");
  }
}

class Test_widget1 extends StatelessWidget {
  const Test_widget1({super.key, required this.title, required this.message});

  final String title, message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 10),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}

class Test_widget2 extends StatelessWidget {
  const Test_widget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Widget 2",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 10,
        ),
        Image.asset(
          'images/Starfield.webp',
          height: 300,
          width: 300,
        )
      ],
    );
  }
}
