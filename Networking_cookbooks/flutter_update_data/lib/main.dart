import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> post_data(String title) async {
  final response =
      await http.post(Uri.parse('https://jsonplaceholder.typicode.com/albums'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({'title': title}));

  if (response.statusCode == 201) {
    print("done");
    return Album.fromjson(jsonDecode(response.body));
  } else
    return throw Exception('error while fetching');
}

/*Future<Album> fetch_data() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200)
    return Album.fromjson(jsonDecode(response.body));
  else
    return throw Exception('error while fetching');
}*/

Future<Album> update_data(String title) async {
  final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title}));

  if (response.statusCode == 200) {
    return Album.fromjson(jsonDecode(response.body));
  } else
    throw Exception('error while fetching');
}

class Album {
  int id;
  String title;

  Album({required this.id, required this.title});

  factory Album.fromjson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title']);
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Album>? future_Album;
  final TextEditingController controller = TextEditingController();

  /*@override
  void initState() {
    future_Album = fetch_data();
  }*/

  @override
  Widget build(BuildContext context) {
    return future_Album == null
        ? Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Title',
                      )),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          future_Album = post_data(controller.text);
                        });
                      },
                      child: Text("create"))
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
            ),
            body: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FutureBuilder(
                      future: future_Album,
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Text(snapshot.data!.title),
                              TextField(
                                controller: controller,
                                decoration:
                                    InputDecoration(hintText: 'enter title'),
                              ),
                              ElevatedButton(
                                  onPressed: (() {
                                    setState(() {
                                      future_Album =
                                          update_data(controller.text);
                                    });
                                  }),
                                  child: Text('update label'))
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        return const CircularProgressIndicator();
                      }))
                ],
              ),
            ),
          );
  }
}
