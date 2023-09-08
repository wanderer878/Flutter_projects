import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mockito_testing/album.dart';

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> createAlbum(http.Client client, String title) async {
  final response = await client.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{'title': title}));

  if (response.statusCode == 201)
    return Album.fromJson(jsonDecode(response.body));
  else
    throw Exception("failed to create");
}

Future<Album> updateAlbum(String title, int id, http.Client client) async {
  final response = await client.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/${id}'),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{'title': title}));

  if (response.statusCode == 200)
    return Album.fromJson(jsonDecode(response.body));
  else
    throw Exception('failed to update');
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(http.Client());
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
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
