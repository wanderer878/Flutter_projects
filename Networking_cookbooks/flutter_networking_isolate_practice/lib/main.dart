import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

List<Photo> parsephoto(String responsebody) {
  final parse = jsonDecode(responsebody).cast<Map<String, dynamic>>();

  return parse.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhoto(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200)
    return compute(parsephoto, response.body);
  //return parsephoto(response.body);
  else
    throw Exception('Failed');
}

class Photo {
  int albumId, id;
  String title, url, thumbnailUrl;

  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(colorScheme: ColorScheme.light(outline: Colors.blueGrey)),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Photo'),
        ),
        body: FutureBuilder(
            future: fetchPhoto(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("an error ocurrred"),
                );
              } else if (snapshot.hasData) {
                return Center(
                  child: PhotosList(photos: snapshot.data!),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  const PhotosList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: photos.length,
                itemBuilder: ((context, index) {
                  return Card_widget(index: index, photos: photos);
                }),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class Card_widget extends StatelessWidget {
  final int index;
  final List<Photo> photos;

  const Card_widget({
    super.key,
    required this.index,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: Theme.of(context).colorScheme.outline, width: 4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(photos[index].thumbnailUrl)),
            title: Text(photos[index].title, overflow: TextOverflow.ellipsis),
            subtitle: Text(photos[index].url),
          ),
        ));
  }
}
