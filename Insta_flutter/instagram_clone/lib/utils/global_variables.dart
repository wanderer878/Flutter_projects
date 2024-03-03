import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_posts.dart';
import 'package:instagram_clone/screens/feeds_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';

const webScreenSize = 600;

const home_screen_items = [
  Feeds(),
  SearchSc(),
  AddPosts(),
  Center(
    child: Text("This is favourite"),
  ),
  Center(
    child: Text("This is person"),
  ),
];
