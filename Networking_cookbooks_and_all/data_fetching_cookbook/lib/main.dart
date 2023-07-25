import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    log(jsonDecode(response.body).toString());
    return Album.fromJson(jsonDecode(response.body));
  }

  throw Exception('Failed to load album');
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return Album(userId: json["userId"], id: json["id"], title: json["title"]);
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
  late Future<Album> future_album;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future_album = fetchAlbum();
  }

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
        home: Scaffold(
          appBar: AppBar(title: Text('data fetching')),
          body: Center(
              child: FutureBuilder<Album>(
            future: future_album,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(snapshot.data!.title);
              else if (snapshot.hasError)
                return Text(snapshot.error.toString());

              return const CircularProgressIndicator();
            },
          )),
        ));
  }
}
