import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:provider/provider.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
        ),
        body: Center(child:
            Consumer<Authprovider>(builder: (context, Authprovider, child) {
          return Authprovider.playlist.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(Authprovider.playlist[index].snippet!.title!),
                    );
                  },
                );
        })));
  }
}
