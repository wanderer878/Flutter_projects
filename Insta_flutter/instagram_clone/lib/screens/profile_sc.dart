import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/Followbutton.dart';

class Profile_sc extends StatefulWidget {
  final userid;
  const Profile_sc({super.key, required this.userid});

  @override
  State<Profile_sc> createState() => _Peofile_scState();
}

class _Peofile_scState extends State<Profile_sc> {
  var userdata = {};
  int postlen = 0;

  @override
  void initState() {
    getuser();
  }

  getuser() async {
    try {
      var UserSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userid)
          .get();

      var PostsSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: widget.userid)
          .get();

      userdata = UserSnap.data()!;
      postlen = PostsSnap.docs.length;

      print(PostsSnap);
      setState(() {});
    } catch (e) {
      showSnackbar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userdata['username']),
        backgroundColor: mobileBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(userdata['photo_url']),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatColumn(postlen, "posts"),
                          buildStatColumn(
                              userdata['followers'].length, "followers"),
                          buildStatColumn(
                              userdata['following'].length, "following"),
                        ],
                      ),
                      Followbutton(
                        backgroundColor: mobileBackgroundColor,
                        bordercolor: primaryColor,
                        text: "Edit profile",
                        txtclr: Colors.grey,
                        function: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                userdata['username'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1),
              alignment: Alignment.centerLeft,
              child: Text(userdata['bio']),
            )
          ],
        ),
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
