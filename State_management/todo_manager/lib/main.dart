import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Todos(),
    child: const MainApp(),
  ));
}

class Todos extends ChangeNotifier {
  List<String> todosList = List.generate(10, (index) => (index + 1).toString());

  void todos_add(String todo) {
    todosList.add(todo);
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo Manager'),
        ),
        body: Center(child: Consumer<Todos>(builder: (context, todos, child) {
          return ListView.builder(
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
                    onTap: () {},
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              });
        })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add a todo'),
                    content: Text('custom dialog'),
                    actions: [
                      TextButton(onPressed: () {}, child: Text('add')),
                      TextButton(onPressed: () {}, child: Text('cancel'))
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
