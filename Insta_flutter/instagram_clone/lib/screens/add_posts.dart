import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("Post to"),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Post",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Center(child: Text("Posts Screen")),
    );
  }
}
