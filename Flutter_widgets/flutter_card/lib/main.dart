import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card_widget(),
        ),
      ),
    );
  }
}

class Card_widget extends StatelessWidget {
  const Card_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text("Flutter McFlutter",
                    style: Theme.of(context).textTheme.titleLarge),
                subtitle: Text("Experienced App Developer",
                    style: Theme.of(context).textTheme.labelLarge),
              ),
              Space(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("123 Main Street",
                      style: Theme.of(context).textTheme.labelLarge),
                  Text("(415)-55-098",
                      style: Theme.of(context).textTheme.labelLarge)
                ],
              ),
              Space(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.accessibility_new_outlined),
                  Icon(Icons.alarm),
                  Icon(Icons.tablet_android),
                  Icon(Icons.mobile_screen_share)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Space extends StatelessWidget {
  const Space({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}
