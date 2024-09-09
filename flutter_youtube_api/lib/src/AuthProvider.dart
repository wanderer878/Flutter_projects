import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:http/http.dart' as http;

class Authprovider extends ChangeNotifier {
  YouTubeApi? _api;
  final List<Playlist> playlist = [];

  bool isloggedin() => _api != null;

  set youtube_key(http.Client client) {
    _api = YouTubeApi(client);
    getplaylist(); //when you want to set something directly , mtlb param me data pass na krna paray
    //blke data directly assign krein jese yahan authclient = value hga  authclient(value)
    //nhi hga to usme set use krte hain taake directly assisgning hjaye
  }

  Future<void> getplaylist() async {
    String? nextPageToken;
    playlist.clear();
    do {
      final response = await _api!.playlists.list(
        ['snippet', 'contentDetails', 'id'],
        maxResults: 50,
        mine: true,
        pageToken: nextPageToken,
      );
      nextPageToken = response.nextPageToken;
      playlist.addAll(response.items!);
      notifyListeners();
    } while (nextPageToken != null);
  }
}
