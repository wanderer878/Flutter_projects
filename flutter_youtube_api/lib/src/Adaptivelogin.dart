import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Adaptivelogin extends StatefulWidget {
  const Adaptivelogin({super.key});

  @override
  State<Adaptivelogin> createState() => _AdaptiveloginState();
}

class _AdaptiveloginState extends State<Adaptivelogin> {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      return _GoogleSigninlogin();
    } else {
      return _GoogleapisAuthLogin();
    }
  }
}

class _GoogleapisAuthLogin extends StatefulWidget {
  @override
  State<_GoogleapisAuthLogin> createState() => _GoogleapisAuthLoginState();
}

class _GoogleapisAuthLoginState extends State<_GoogleapisAuthLogin> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text("Login on windows/Mac/Linux"));
  }
}

class _GoogleSigninlogin extends StatefulWidget {
  @override
  State<_GoogleSigninlogin> createState() => _GoogleSigninloginState();
}

class _GoogleSigninloginState extends State<_GoogleSigninlogin> {
  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(scopes: []);
  }

  late final GoogleSignIn _googleSignIn;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _googleSignIn.signIn();
        },
        child: Text("Login on android/ios/web"));
  }
}
