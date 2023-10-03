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
  final todos = <String>[];
  final _controller = TextEditingController();
  show_bar(txt, context) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(txt)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Drag drop testing"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) => {
                            todos.removeAt(index),
                            show_bar("removed", context)
                          },
                          background: Container(
                            color: Colors.red,
                          ),
                          child: ListTile(
                            title: Text(todos[index]),
                          ),
                        );
                      }),
                )
              ],
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
                    : show_bar("Nothing to add", context);
              },
              child: Icon(Icons.add),
            );
          })),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todos.removeAt(index),
                    background: Container(color: Colors.red),
                    child: ListTile(title: Text(todo)),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
