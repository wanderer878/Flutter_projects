import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Todos(),
    child: MaterialApp(home: MainApp()),
  ));
}

class Todos extends ChangeNotifier {
  List<String> todosList = [];

  void todos_add(String todo) {
    todosList.add(todo);
    notifyListeners();
  }

  void todos_remove(String todo) {
    todosList.remove(todo);
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo Manager'),
        ),
        body: Center(child: Consumer<Todos>(builder: (context, todos, child) {
          return todos.todosList.isNotEmpty
              ? ListView.builder(
                  itemCount: todos.todosList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                        checkColor: Colors.red,
                      ),
                      title: Text(todos.todosList[index]),
                      trailing: GestureDetector(
                        onTap: () {
                          todos.todos_remove(todos.todosList[index]);
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  })
              : Text('Nothing to show here');
        })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add a todo'),
                    content: TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: 'Add a todo'),
                    ),
                    actions: [
                      Consumer<Todos>(builder: (context, todo, child) {
                        return ElevatedButton(
                            onPressed: () {
                              if (_controller.text.isNotEmpty &&
                                  !todo.todosList.contains(_controller.text)) {
                                Provider.of<Todos>(context, listen: false)
                                    .todos_add(_controller.text);
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Add'));
                      }),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      )
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
