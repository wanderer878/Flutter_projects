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
    final Map<String, String?>? _playlistId =
        Provider.of<Authprovider>(context, listen: true).detailsData;
    return _playlistId != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(_playlistId['playlistTitle'].toString()),
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Consumer<Authprovider>(
                          builder: (context, authProvider, child) {
                        if (authProvider
                                .playlistItems[_playlistId['playlistId']] ==
                            null) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                              itemCount: authProvider
                                  .playlistItems[_playlistId['playlistId']]!
                                  .length,
                              itemBuilder: (context, index) {
                                final item = authProvider.playlistItems[
                                    _playlistId['playlistId']]![index];
                                final thumbnails = item.snippet?.thumbnails;
                                if (thumbnails != null &&
                                    thumbnails.standard != null) {
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      children: [
                                        AspectRatio(
                                            aspectRatio: 4 / 3,
                                            child: Stack(
                                              fit: StackFit.expand,
                                              alignment: Alignment.center,
                                              children: [
                                                Image.network(
                                                    fit: BoxFit.fill,
                                                    thumbnails.standard!.url
                                                        .toString()),
                                                Positioned.fill(
                                                    child: ClipRRect(
                                                  child: BackdropFilter(
                                                      child: Container(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 15,
                                                        sigmaY: 15,
                                                      )),
                                                )),
                                                Center(
                                                  child: Container(
                                                    margin: EdgeInsets.all(10),
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            157, 43, 42, 42),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 5,
                                                        )),
                                                    child: Text(
                                                      item.snippet!.title
                                                          .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  );
                                }

                                return SizedBox.shrink();
                              });
                        }
                      }),
                    )
                  ]),
            ))
        : Scaffold(
            appBar: AppBar(
              title: Text("Detail View"),
            ),
            body: Center(
              child: Text("Select a playlist to view details"),
            ),
          );
  }
}
