import 'package:blog_posts/Blog_provider.dart';
import 'package:blog_posts/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_navigator.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Blog_provider(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CustomNavigator());
  }
}
