import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:http/http.dart' as http;

class Authprovider extends ChangeNotifier {
  YouTubeApi? _api;

  bool isloggedin() => _api != null;

  set youtube_key(http.Client client) {
    _api = YouTubeApi(client);
    print(_api.toString());
  }
}
