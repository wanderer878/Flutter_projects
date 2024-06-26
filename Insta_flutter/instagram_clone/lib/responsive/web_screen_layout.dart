import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/models/user.dart' as model;

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void On_page_changed(int page) {
    setState(() {
      _page = page;
    });
  }

  void On_navigation_tapped(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<User_provider>(context).get_user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          height: 32,
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
        ),
        actions: [
          IconButton(
              onPressed: () {
                On_navigation_tapped(0);
              },
              icon: Icon(
                Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor,
              )),
          IconButton(
              onPressed: () {
                On_navigation_tapped(1);
              },
              icon: Icon(Icons.search,
                  color: _page == 1 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () {
                On_navigation_tapped(2);
              },
              icon: Icon(Icons.add_circle,
                  color: _page == 2 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () {
                On_navigation_tapped(3);
              },
              icon: Icon(Icons.bookmark,
                  color: _page == 3 ? primaryColor : secondaryColor)),
          IconButton(
              onPressed: () {
                On_navigation_tapped(4);
              },
              icon: Icon(Icons.person,
                  color: _page == 4 ? primaryColor : secondaryColor)),
        ],
      ),
      body: PageView(
        children: home_screen_items,
        controller: pageController,
        onPageChanged: On_page_changed,
      ),
    );
  }
}
