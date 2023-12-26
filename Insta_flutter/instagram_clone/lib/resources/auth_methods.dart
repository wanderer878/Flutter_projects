import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class Auth_methods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String photo_url = "no photo";

  Future<String> signup({
    required String username,
    required String password,
    required String email,
    required String bio,
    required Uint8List? file,
  }) async {
    String res = 'an error occurred';

    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          bio.isNotEmpty) {
        //register user
        UserCredential user_cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //Saving users data in firebase storage like images , posts, profilepics etc.
        photo_url = await StorageMethods()
            .UploadImgToStorage('profilePics', file, false);

        print(user_cred.user!.uid);
        //adding collection
        await _firestore.collection("users").doc(user_cred.user!.uid).set({
          'username': username,
          "uid": user_cred.user!.uid,
          "email": email,
          "bio": bio,
          "followers": [],
          "following": [],
          "photo_url": photo_url,
        });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
