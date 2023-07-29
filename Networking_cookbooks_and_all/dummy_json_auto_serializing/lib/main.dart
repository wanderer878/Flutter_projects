import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'products.dart';

Future<Products> fetchProducts() async {
  Products products;

  final response =
      await http.get(Uri.parse('https://dummyjson.com/products/1'));

  if (response.statusCode == 200) {
    products = Products.fromJson(jsonDecode(response.body));
    return products;
  } else {
    throw Exception(response.body);
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<Products> futureProducts = fetchProducts();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: futureProducts,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Data_widget(snapshot: snapshot);
                          } else if (snapshot.hasError) {
                            Text('error occured');
                          }
                          return CircularProgressIndicator();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Data_widget extends StatelessWidget {
  final AsyncSnapshot<Products> snapshot;

  const Data_widget({
    required this.snapshot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
              child: Text(
                snapshot.data!.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                snapshot.data!.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          snapshot.data!.description,
        ),
      ],
    );
  }
}
