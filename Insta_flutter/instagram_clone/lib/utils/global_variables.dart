import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_posts.dart';
import 'package:instagram_clone/screens/feeds_screen.dart';
import 'package:instagram_clone/screens/profile_sc.dart';
import 'package:instagram_clone/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> home_screen_items = [
  Profile_sc(
    userid: FirebaseAuth.instance.currentUser!.uid,
  ),
  Feeds(),
  SearchSc(),
  AddPosts(),
  Center(
    child: Text("This is favourite"),
  ),
  //Profile_sc()
];
