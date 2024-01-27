import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class Firestore_methods {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String uid, String description, Uint8List file,
      String username, String profImage) async {
    String res = "an Error occured";

    try {
      String photo_url =
          await StorageMethods().UploadImgToStorage("posts", file, true);

      String postId = const Uuid().v1();

      Post post = Post(
          description: description,
          uid: uid, 
          username: username,
          likes: [],
          postId: postId,
          datePublished: DateTime.now(),
          post_url: photo_url,
          profImage: profImage);

       _firestore.collection("posts").doc(postId).set(post.toJson());

      res = "success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
