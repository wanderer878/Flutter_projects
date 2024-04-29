import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/models/user.dart' as model;

class Auth_methods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String photo_url = "no photo";

  //get user details
  Future<model.User> getUserdetails() async {
    DocumentSnapshot snapshot = await _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return model.User.fromSnap(snapshot);
  }

  //Signing up user
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

        model.User user = model.User(
            username: username,
            userId: user_cred.user!.uid,
            email: email,
            bio: bio,
            photo_url: photo_url,
            followers: [],
            following: [],
            saved_posts: []
          );

        print(user_cred.user!.uid);
        //adding collection
        await _firestore
            .collection("users")
            .doc(user_cred.user!.uid)
            .set(user.toJson());

        res = "success";
      } else {
        res = "please enter all fields";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> signin(
      {required String email, required String password}) async {
    String res = "an error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = "please enter all fields";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<void> signout() async {
    await _auth.signOut();
  }
}
