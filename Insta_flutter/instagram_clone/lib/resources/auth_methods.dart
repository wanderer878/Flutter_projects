import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

class Auth_methods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signup({
    required String username,
    required String password,
    required String email,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'an error occurred';

    try {
      if (username.isNotEmpty ||
          password.isNotEmpty ||
          email.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user
        UserCredential user_cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
