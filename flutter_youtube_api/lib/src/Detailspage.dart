import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:provider/provider.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    //final PlaylistItems = context.watch<Authprovider>().p;
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Details Page')]),
        ));
  }
}
