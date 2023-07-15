import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> send_data(String title) async {
  final response =
      await http.post(Uri.parse("https://jsonplaceholder.typicode.com/albums"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': title,
          }));

  if (response.statusCode == 201)
    return Album.fromJson(jsonDecode(response.body));
  else
    throw Exception("error occured");
}

class Album {
  int id;
  String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Album>? getdata;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return getdata == null
        ? Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'input title'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        getdata = send_data(controller.text);
                      });
                    },
                    child: const Text('submit'),
                  )
                ],
              )),
            ))
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: getdata,
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Text(snapshot.data!.title);
                      else if (snapshot.hasError)
                        return Text(snapshot.error.toString());

                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ));
  }
}
