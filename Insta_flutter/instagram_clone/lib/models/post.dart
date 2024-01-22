import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final likes;
  final String postId;
  final DateTime datePublished;
  final String post_url;
  final String profImage;

  const Post(
      {required this.description,
      required this.uid,
      required this.username,
      required this.likes,
      required this.postId,
      required this.datePublished,
      required this.post_url,
      required this.profImage});

  Map<String, dynamic> toJson() => {
        'description': description,
        "uid": uid,
        "username": username,
        "likes": likes,
        "postId": postId,
        "datePublished": datePublished,
        "post_url": post_url,
        "profImage": profImage,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapMap = (snap.data() as Map<String, dynamic>);

    return Post(
        description: snapMap["description"],
      uid: snapMap["uid"],
      likes: snapMap["likes"],
      postId: snapMap["postId"],
      datePublished: snapMap["datePublished"],
      username: snapMap["username"],
      post_url: snapMap['postUrl'],
      profImage: snapMap['profImage']);
  }
}
