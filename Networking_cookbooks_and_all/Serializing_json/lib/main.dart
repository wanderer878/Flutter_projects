import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import 'album.dart';

var album;

Future<Album> fetch_Album() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    album = Album.fromJson(jsonDecode(response.body));
    return album;
  } else {
    throw Exception('Error occured');
  }
}

Future<Album> update_Album(String title) async {
  final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(Album(id: album.id, title: title)));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error occured in update album');
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
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "enter title"),
                controller: _controller,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      updating_future();
                    });
                  },
                  child: Text("update")),
              const SizedBox(
                height: 10,
              ),
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
          ),
        )),
      ),
    );
  }

  updating_future() {
    if (_controller.text != '') {
      future_Album = update_Album(_controller.text);
    }
  }
}
