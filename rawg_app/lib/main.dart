import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

List<List<dynamic>> getGames(Map ResponseMap) {
  List<List<dynamic>> parsedlist = [];

  final parsed_games = jsonDecode(ResponseMap['response_games'])['results']
      .cast<Map<String, dynamic>>();

  final parsed_genres = jsonDecode(ResponseMap['response_genres'])['results']
      .cast<Map<String, dynamic>>();

  parsedlist.add(
      parsed_games.map<Games>((element) => Games.fromJson(element)).toList());
  parsedlist.add(parsed_genres
      .map<Genres>((element) => Genres.fromJson(element))
      .toList());

  return parsedlist;
}

Future<List<List<dynamic>>> parseGames(http.Client client) async {
  Map<String, String> map = Map();

  final response_games = await client.get(Uri.parse(
      'https://api.rawg.io/api/games?key=1a71011ad0f84690a60d62a200dde7cb'));

  final response_genres = await client.get(Uri.parse(
      'https://api.rawg.io/api/genres?key=1a71011ad0f84690a60d62a200dde7cb'));

  map['response_games'] = response_games.body;
  map['response_genres'] = response_genres.body;

  return compute(getGames, map);
}

class Genres {
  final String name;
  final String image_background;

  const Genres({
    required this.name,
    required this.image_background,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
        name: json['name'] as String,
        image_background: json['image_background'] as String);
  }
}

class Games {
  final String name;
  final String released;
  final String background_image;

  const Games(
      {required this.name,
      required this.released,
      required this.background_image});

  factory Games.fromJson(Map<String, dynamic> Json) {
    return Games(
        name: Json['name'] as String,
        released: Json['released'] as String,
        background_image: Json['background_image'] as String);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
            background: Colors.blueGrey[900],
            primaryContainer: Colors.blueGrey[800],
            onPrimaryContainer: Colors.black,
            onBackground: Colors.black),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
                displayMedium: TextStyle(fontSize: 20),
                displaySmall: TextStyle(fontSize: 13))
            .apply(displayColor: Colors.white),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Rawg Gaming Database'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
        child: Center(
            child: FutureBuilder<List<List<dynamic>>>(
                future: parseGames(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('oops an error'),
                    );
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CategoryName(heading :"All Time Best"),
                          SizedBox(height: 5),
                          games_list(list: snapshot.data![0]),
                          SizedBox(height: 50),
                          CategoryName(heading :"Genres"),
                          games_list(list: snapshot.data![1])
                        ],
                      ),
                    );
                    ;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CategoryName extends StatelessWidget {
  const CategoryName({
    required this.heading,
    super.key,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.onBackground,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 5, 0, 5),
        child: Text(
          heading,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class games_list extends StatelessWidget {
  final List list;

  const games_list({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      height: 300,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: list.runtimeType == (List<Games>)
              ? list.map((element) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/download.png'),
                                image: NetworkImage(element.background_image),
                                fit: BoxFit.contain),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              element.name,
                              style: Theme.of(context).textTheme.displayMedium,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(element.released,
                              style: Theme.of(context).textTheme.displaySmall),
                        ],
                      ),
                    ),
                  );
                }).toList()
              : list.map((element) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/download.png'),
                                image: NetworkImage(element.image_background),
                                fit: BoxFit.contain),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              element.name,
                              style: Theme.of(context).textTheme.displayMedium,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /*Text(element.released,
                              style: Theme.of(context).textTheme.displaySmall),*/
                        ],
                      ),
                    ),
                  );
                }).toList()),
    );
  }
}
