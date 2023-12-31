import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String username;
  final UserCredential userId;
  final String email;
  final String bio;
  final List<dynamic> followers;
  final List<dynamic> following;
  final String photo_url;

  const User(
      {required this.username,
      required this.userId,
      required this.email,
      required this.bio,
      required this.followers,
      required this.following,
      required this.photo_url});

  Map<String, dynamic> toJson() => {
        'username': username,
        "uid": userId,
        "email": email,
        "bio": bio,
        "followers": [],
        "following": [],
        "photo_url": photo_url,
      };
}
