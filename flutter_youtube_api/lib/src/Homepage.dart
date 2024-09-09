import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<Authprovider>(
                  builder: (context, Authprovider, child) {
                return Authprovider.playlist.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: Authprovider.playlist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Authprovider.getplaylistItems(
                                  playlistId: Authprovider.playlist[index].id!);
                              context.go('/details',
                                  extra: Authprovider.playlist[index].id);
                            },
                            child: ListTile(
                              title: Text(
                                  Authprovider.playlist[index].snippet!.title!),
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        )));
  }
}
