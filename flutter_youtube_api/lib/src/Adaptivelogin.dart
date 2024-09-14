import 'dart:io';

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/link.dart';

class Adaptivelogin extends StatefulWidget {
  const Adaptivelogin({super.key, required this.scopes});

  final List<String> scopes;

  @override
  State<Adaptivelogin> createState() => _AdaptiveloginState();
}

class _AdaptiveloginState extends State<Adaptivelogin> {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      return _GoogleSigninlogin(
        scopes: widget.scopes,
      );
    } else {
      return _GoogleapisAuthLogin(
        scopes: widget.scopes,
      );
    }
  }
}

class _GoogleapisAuthLogin extends StatefulWidget {
  final List<String> scopes;

  const _GoogleapisAuthLogin({super.key, required this.scopes});

  @override
  State<_GoogleapisAuthLogin> createState() => _GoogleapisAuthLoginState();
}

class _GoogleapisAuthLoginState extends State<_GoogleapisAuthLogin> {
  ClientId _clientId = ClientId(
    dotenv.env['CLIENT_ID']!,
    dotenv.env['CLIENT_SECRET']!,
  );

  Uri? _redirectUri;

  @override
  void initState() {
    super.initState();
    clientViaUserConsent(_clientId, widget.scopes, (url) {
      setState(() {
        _redirectUri = Uri.parse(url);
      });
    }).then((authclient) {
      context.read<Authprovider>().youtube_key = authclient;
      context.go('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _redirectUri != null
            ? Link(
                uri: _redirectUri,
                builder: (_, followlink) => ElevatedButton(
                    onPressed: followlink,
                    child: Text("login windows/mac/linux")),
              )
            : CircularProgressIndicator());
  }
}

class _GoogleSigninlogin extends StatefulWidget {
  final List<String> scopes;

  const _GoogleSigninlogin({super.key, required this.scopes});

  @override
  State<_GoogleSigninlogin> createState() => _GoogleSigninloginState();
}

class _GoogleSigninloginState extends State<_GoogleSigninlogin> {
  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(scopes: widget.scopes);
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
