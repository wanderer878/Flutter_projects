import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/src/Adaptivelogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Adaptivelogin(
          scopes: [
            'https://www.googleapis.com/auth/youtube.readonly',
          ],
        ),
      ),
    );
  }
}
