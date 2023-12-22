import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth_methods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signup({
    required String username,
    required String password,
    required String email,
    required String bio,
    //required Uint8List file,
  }) async {
    String res = 'an error occurred';

    try {
      if (username.isNotEmpty &&
              password.isNotEmpty &&
              email.isNotEmpty &&
              bio.isNotEmpty /*||
          file != null*/
          ) {
        //register user
        UserCredential user_cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(user_cred.user!.uid);
        //adding collection
        await _firestore.collection("users").doc(user_cred.user!.uid).set({
          'username': username,
          "uid": user_cred.user!.uid,
          "email": email,
          "bio": bio,
          "followers": [],
          "following": []
        });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
