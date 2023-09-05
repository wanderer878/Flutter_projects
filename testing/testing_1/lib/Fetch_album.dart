import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetch_Album(http.Client client) async {
  final response = await client
      .get(Uri.parse('"https://jsonplaceholder.typicode.com/albums/1"'));

  if (response.statusCode == 200)
    return Album.fromJson(jsonDecode(response.body));
  else {
    throw Exception('failed');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Fetch_album extends StatefulWidget {
  const Fetch_album({super.key});

  @override
  State<Fetch_album> createState() => _Fetch_albumState();
}

class _Fetch_albumState extends State<Fetch_album> {
  late final Future<Album> future_album;

  @override
  void initState() {
    super.initState();
    future_album = fetch_Album(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mockito_testing"),
      ),
      body: Center(
        child: Column(children: [
          FutureBuilder<Album>(
            future: future_album,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text(snapshot.data!.title);
              else if (snapshot.hasError)
                return Text(snapshot.error.toString());

              return const CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
