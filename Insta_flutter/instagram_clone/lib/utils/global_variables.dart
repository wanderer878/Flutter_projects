import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_posts.dart';
import 'package:instagram_clone/screens/feeds_screen.dart';
import 'package:instagram_clone/screens/profile_sc.dart';
import 'package:instagram_clone/screens/search_screen.dart';

const webScreenSize = 600;

const home_screen_items = [
  Profile_sc(),
  Feeds(),
  SearchSc(),
  AddPosts(),
  Center(
    child: Text("This is favourite"),
  ),
  //Profile_sc()
];
