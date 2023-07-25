import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

Future<Album> fetch_album() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200)
    return Album.fromJson(jsonDecode(response.body));
  else
    throw Exception('Failed');
}

class Album {
  int userId, id;
  String title;
  Album({required this.userId, required this.title, required this.id});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      title: json['title'],
      id: json['id'],
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetch_album();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Text(snapshot.data!.title);
                else if (snapshot.hasError) return Text("${snapshot.error}");
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
