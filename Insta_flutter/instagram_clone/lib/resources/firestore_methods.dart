import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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

  Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> likeComment(
      String postId, String commentId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .update({
          'likedby': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .update({
          'likedby': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<String> postComment(String postId, String text, String uid,
      String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
          'likedby': [],
          'postId': postId
        });
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
    } catch (e) {
      e.toString();
    }
  }

  Future<void> follow_user(String uid, String followid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(uid).get();
      List following = snapshot.data()!['following'];
      if (following.contains(followid)) {
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followid])
        });

        await _firestore.collection('users').doc(followid).update({
          'followers': FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followid])
        });

        await _firestore.collection('users').doc(followid).update({
          'followers': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> save_post(String postId, String uid, List saved_posts) async {
    // not working
    try {
      /*saved_posts.contains(postId) ? await _firestore.collection("users").doc(uid).update({
        "saved_posts": FieldValue.arrayRemove([postId])
      }) 
      :
       await _firestore.collection("users").doc(uid).update(
        {
          "saved_posts": FieldValue.arrayUnion([postId])
        }
      );*/
      print(saved_posts);
      if (!saved_posts.contains(postId)) {
        await _firestore.collection('users').doc(uid).update({
          'saved_posts': FieldValue.arrayUnion([postId])
        });

        print("added ");
      } else {
        await _firestore.collection('users').doc(uid).update({
          'saved_posts': FieldValue.arrayRemove([postId])
        });
        print("removed");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
