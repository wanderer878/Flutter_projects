import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:provider/provider.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    final _playlistId = GoRouterState.of(context).extra as String;
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Consumer<Authprovider>(
                  builder: (context, authProvider, child) {
                if (authProvider.playlistItems[_playlistId] == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount:
                          authProvider.playlistItems[_playlistId]!.length,
                      itemBuilder: (context, index) {
                        final item =
                            authProvider.playlistItems[_playlistId]![index];
                        final thumbnails = item.snippet?.thumbnails;
                        if (thumbnails != null && thumbnails.standard != null) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AspectRatio(
                                      aspectRatio: 4 / 3,
                                      child: Stack(
                                        children: [
                                          ClipRect(
                                            child: Image.network(
                                                fit: BoxFit.fitWidth,
                                                thumbnails.standard!.url
                                                    .toString()),
                                          ),
                                          Positioned.fill(
                                              child: ClipRRect(
                                            child: BackdropFilter(
                                                child: Container(
                                                  color: Colors.transparent,
                                                ),
                                                filter: ImageFilter.blur(
                                                  sigmaX: 10,
                                                  sigmaY: 10,
                                                )),
                                          ))
                                        ],
                                      )),
                                  Text('Hello')
                                ],
                              ),
                            ),
                          );
                        }

                        return SizedBox.shrink();
                      });
                }
              }),
            )
          ]),
        ));
  }
}
