import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String username;
  final String userId;
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

  static User fromSnap(DocumentSnapshot snap) {
    var snapMap = (snap.data() as Map<String, dynamic>);

    return User(
        username: snapMap["username"],
        userId: snapMap["uid"],
        email: snapMap["email"],
        bio: snapMap["bio"],
        followers: snapMap["followers"],
        following: snapMap["following"],
        photo_url: snapMap["photo_url"]);
  }
}
