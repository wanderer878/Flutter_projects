import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/favourites.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Favourites(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FavoritesPage());
  }
}
