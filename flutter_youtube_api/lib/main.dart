import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_youtube_api/src/AuthProvider.dart';
import 'package:flutter_youtube_api/src/Detailspage.dart';
import 'package:flutter_youtube_api/src/Homepage.dart';
import 'package:flutter_youtube_api/src/Login.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(ChangeNotifierProvider<Authprovider>(
      create: (context) => Authprovider(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GoRouter _router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) {
          return Homepage();
        },
        redirect: (context, state) {
          if (!context.read<Authprovider>().isloggedin()) {
            return "/login";
          } else {
            return null;
          }
        },
        routes: <RouteBase>[
          GoRoute(path: 'login', builder: (context, state) => LoginPage()),
          GoRoute(
              path: 'details',
              builder: (context, state) {
                return Detailspage();
              })
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
