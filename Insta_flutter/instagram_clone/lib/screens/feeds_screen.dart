import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:instagram_clone/widgets/Post_card.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    double _screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _screen_width < webScreenSize
            ? mobileBackgroundColor
            : webBackgroundColor,
        floatingActionButton: _screen_width > webScreenSize
            ? FloatingActionButton(
                backgroundColor: mobileBackgroundColor,
                child: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: primaryColor,
                ),
                onPressed: () {})
            : null,
        appBar: _screen_width < webScreenSize
            ? AppBar(
                backgroundColor: mobileBackgroundColor,
                title: //Image.asset('assets/inseed_high_resolution_logo.png'),
                    SvgPicture.asset(
                  'assets/inseed_high_resolution_logo(1).svg',
                  height: 50,
                  color: primaryColor,
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chat_bubble_outline_rounded))
                ],
              )
            : null,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: _screen_width < webScreenSize
                              ? 0
                              : _screen_width * 0.3,
                          vertical: _screen_width > webScreenSize ? 15 : 0),
                      child: PostCard(snap: snapshot.data!.docs[index].data()),
                    );
                  });
            }));
  }
}
