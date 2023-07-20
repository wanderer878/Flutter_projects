import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

Future<Album> Fetch_Album() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  if (response.statusCode == 200)
    return Album.fromJson(jsonDecode(response.body));
  else
    throw Exception("error occured");
}

Future<Album> delete_data(int id) async {
  final response = await http.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200)
    return Album.fromJson(jsonDecode(response.body));
  else
    throw Exception("error occured");
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title']);
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<Album> future_album;

  @override
  void initState() {
    super.initState();
    future_album = Fetch_Album();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: future_album,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Text(snapshot.data!.title);
                  else if (snapshot.hasError)
                    return Text(snapshot.error.toString());

                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
