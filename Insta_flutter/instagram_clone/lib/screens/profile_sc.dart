import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isFollowing = false;
  late bool isLoading;

  @override
  void initState() {
    getuser();
  }

  getuser() async {
    setState(() {
      isLoading = true;
    });

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

      isFollowing = UserSnap.data()!['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);

      //print(PostsSnap.docs.runtimeType);
      setState(() {});
    } catch (e) {
      showSnackbar(e.toString(), context);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
                        backgroundColor: secondaryColor,
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
                            FirebaseAuth.instance.currentUser!.uid ==
                                    widget.userid
                                ? Followbutton(
                                    backgroundColor: mobileBackgroundColor,
                                    bordercolor: primaryColor,
                                    text: "Edit profile",
                                    txtclr: secondaryColor,
                                    function: () {},
                                  )
                                : isFollowing
                                    ? Followbutton(
                                        backgroundColor: secondaryColor,
                                        bordercolor: secondaryColor,
                                        text: "Unfollow",
                                        txtclr: primaryColor,
                                        function: () {},
                                      )
                                    : Followbutton(
                                        backgroundColor: blueColor,
                                        bordercolor: blueColor,
                                        text: "follow",
                                        txtclr: primaryColor,
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
                  ),
                  const Divider(
                    thickness: 2.0,
                  ),
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('posts')
                          .where('uid', isEqualTo: widget.userid)
                          .get(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (!snapshot.hasData) {
                          return Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return Expanded(
                          child: GridView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 1.5,
                                      childAspectRatio: 1),
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: primaryColor, width: 2.0)),
                                  child: Image(
                                    image: NetworkImage(snapshot
                                        .data!.docs[index]
                                        .data()['post_url']),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                        );
                      })
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
