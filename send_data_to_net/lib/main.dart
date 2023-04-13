import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title)async {
  final response = await http.post(
    Uri.parse("'https://jsonplaceholder.typicode.com/albums"),
    headers: <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{
      "title": title
    })
  );

  if (response.statusCode == 201) {
    return Album.fromjson(jsonDecode(response.body));
  }
  else{
    throw Exception("failed to create album");
  }
}

class Album {
  final int id;
  final String title;

  const Album({
    required this.id,
    required this.title
  });

  factory Album.fromjson(Map<String,dynamic> json){
    return Album(
      id: json["id"],
      title: json["title"],
    );
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
