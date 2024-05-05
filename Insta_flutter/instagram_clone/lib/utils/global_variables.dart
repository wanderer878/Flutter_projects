import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_posts.dart';
import 'package:instagram_clone/screens/favourite_screen.dart';
import 'package:instagram_clone/screens/feeds_screen.dart';
import 'package:instagram_clone/screens/profile_sc.dart';
import 'package:instagram_clone/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> home_screen_items = [
  Feeds(),
  SearchSc(),
  AddPosts(),
  Fav_sc(),
  Profile_sc(
    userid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
