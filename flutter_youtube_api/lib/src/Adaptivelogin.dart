import 'dart:io';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('data');
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
    _googleSignIn = GoogleSignIn(scopes: [
      'https://www.googleapis.com/auth/youtube.readonly',
    ]);
    _googleSignIn.onCurrentUserChanged.listen((account) {
      if (account != null) {
        _googleSignIn.authenticatedClient().then((authclient) {
          if (authclient != null) {
            context.read<Authprovider>().youtube_key = authclient;
            context.go('/');
          }
        });
      }
    });
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
