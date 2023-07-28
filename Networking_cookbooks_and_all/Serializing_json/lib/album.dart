import 'package:json_annotation/json_annotation.dart';

// Remember = File name here album.g.dart should be same as filename or else it will give error.
part "album.g.dart";

@JsonSerializable()
class Album {
  String title;
  int id;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return _$AlbumFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AlbumToJson(this);
  }
}
