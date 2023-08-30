import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Todos(),
    child: MaterialApp(home: MainApp()),
  ));
}

class Todos extends ChangeNotifier {
  List<Map<String, dynamic>> todosList = [];
  void todos_add(String todo, {bool isChecked = false}) {
    todosList.add({"todo": todo, "isChecked": isChecked});
    notifyListeners();
  }

  void todos_remove(int index) {
    todosList.removeAt(index);
    notifyListeners();
  }

  void complete(int index, bool value) {
    todosList[index] = <String, dynamic>{
      "todo": todosList[index]["todo"],
      "isChecked": value
    };
    notifyListeners();
  }
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
                        value: todos.todosList[index]['isChecked'],
                        onChanged: (value) {
                          setState(() {
                            todos.complete(index, value!);
                          });
                        },
                      ),
                      title: Text(todos.todosList[index]['todo'],
                          style: TextStyle(
                              decoration: !todos.todosList[index]['isChecked']
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough)),
                      trailing: GestureDetector(
                        onTap: () {
                          todos.todos_remove(index);
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
                                  !checklist(
                                      todo.todosList, _controller.text)) {
                                Provider.of<Todos>(context, listen: false)
                                    .todos_add(
                                  _controller.text,
                                );
                                _controller.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Add'));
                      }),
                      OutlinedButton(
                        onPressed: () {
                          _controller.clear();
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

  bool checklist(List<Map<String, dynamic>> maps_list, String value) {
    bool check = false;

    maps_list.forEach((element) {
      check = element["todo"] == value ? true : check;
    });

    return check;
  }
}
