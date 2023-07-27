import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import 'album.dart';

var album;

Future<Album> fetch_Album() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1'));

  if (response.statusCode == 200) {
    album = Album.fromJson(jsonDecode(response.body));
    return album;
  } else {
    throw Exception('Error occured');
  }
}

Future<Album> update_Album() async {
  final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/photos/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(Album));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error occured');
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
  late Future<Album> future_Album;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    future_Album = fetch_Album();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "enter title"),
              controller: _controller,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    future_Album = update_Album();
                  });
                },
                child: Text("update")),
            FutureBuilder(
                future: future_Album,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Text('Error occured');
                  }

                  return CircularProgressIndicator();
                })
          ],
        )),
      ),
    );
  }
}
