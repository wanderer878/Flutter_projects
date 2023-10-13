import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/favourites.dart';
import 'package:testing_codelab/screens/home.dart';

void main() {
  runApp(const MainApp());
}

final _router = GoRouter(routes: [
  GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: FavoritesPage.routeName,
          builder: (context, state) {
            return const FavoritesPage();
          },
        )
      ])
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favourites>(
      create: (context) => Favourites(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Testing Sample',
        routerConfig: _router,
      ),
    );
  }
}
