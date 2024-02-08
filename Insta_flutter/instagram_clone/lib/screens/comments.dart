import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/widgets/Comment_Card.dart';
import 'package:provider/provider.dart';

class Comments_sc extends StatefulWidget {
  final snap;
  const Comments_sc({super.key, required this.snap});

  @override
  State<Comments_sc> createState() => _Comments_scState();
}

class _Comments_scState extends State<Comments_sc> {
  TextEditingController _commentsController = TextEditingController();

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<User_provider>(context).get_user;


    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Comments"),
      ),
      body: CommentCard(), //StreamBuilder(stream: FirebaseFirestore.instance.collection(collectionPath), builder: builder),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1682685796965-9814afcbff55?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: _commentsController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${user.username}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Firestore_methods().postComment(widget.snap["postId"],_commentsController.text, user.userId, user.username, user.photo_url);
                  setState(() {
                    _commentsController.clear();
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}