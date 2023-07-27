import 'package:json_annotation/json_annotation.dart';

// Remember = File name here album.g.dart should be same as filename or else it will give error.
part "album.g.dart";

@JsonSerializable()
class Album {
  String title;
  int id;
  String url;

  Album({required this.id, required this.title, required this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return _$AlbumFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AlbumToJson(this);
  }
}
