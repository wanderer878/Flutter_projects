import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:instagram_clone/widgets/Post_card.dart';
import 'package:provider/provider.dart';

class Fav_sc extends StatefulWidget {
  const Fav_sc({super.key});

  @override
  State<Fav_sc> createState() => _Fav_scState();
}

class _Fav_scState extends State<Fav_sc> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User_provider>(context).get_user;
    double _screen_width = MediaQuery.of(context).size.width;
    //print(user.saved_posts);
    return Scaffold(
        backgroundColor: _screen_width < webScreenSize
            ? mobileBackgroundColor
            : webBackgroundColor,
        appBar: _screen_width < webScreenSize
            ? AppBar(
                title: Text('Saved Seeds'),
                backgroundColor: mobileBackgroundColor,
              )
            : null,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("posts").snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return user.saved_posts.isEmpty
                  ? Center(
                      child: Text('Nothing to show , Let\'s save something !'),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (_, index) {
                        return user.saved_posts.contains(
                                snapshot.data!.docs[index].data()["postId"])
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: _screen_width < webScreenSize
                                        ? 0
                                        : _screen_width * 0.3,
                                    vertical:
                                        _screen_width > webScreenSize ? 15 : 0),
                                child: PostCard(
                                    snap: snapshot.data!.docs[index].data()),
                              )
                            : SizedBox(
                                height: 0,
                              );
                      });
            }));
  }
}
