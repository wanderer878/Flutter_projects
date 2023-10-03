import 'package:flutter/material.dart';

void main() {
  runApp(const drag_drop());
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              //NewWidget(),
              //Test_widget1(title: "StarField", message: "Such a great game"),
              //Test_widget2()
              drag_drop(),
            ],
          ),
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

class drag_drop extends StatefulWidget {
  const drag_drop({super.key});

  @override
  State<drag_drop> createState() => _drag_dropState();
}

class _drag_dropState extends State<drag_drop> {
  final todos = <String>["hello", "world"];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Drag drop testing"),
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todos[index]),
                        );
                      })
                ],
              ),
            ),
          ),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                _controller.text.isNotEmpty
                    ? setState(
                        () {
                          todos.add(_controller.text);
                          _controller.clear();
                        },
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nothing to add")));
              },
              child: Icon(Icons.add),
            );
          })),
    );
  }
}
