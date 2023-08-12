import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final List<String> todos = [
    'play games',
    'study',
    'breakfast',
    'lunch',
    'dinner'
  ];

  Todo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 40),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(todos: todos[index])));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [Text(todos[index])],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Details extends StatelessWidget {
  final String todos;

  const Details({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text(todos),
      ),
    );
  }
}
