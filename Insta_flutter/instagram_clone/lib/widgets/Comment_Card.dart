import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              snap['profilePic'],
            ),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: snap['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor)),
                        TextSpan(
                            text: ' ${snap['text']}',
                            style: const TextStyle(color: primaryColor)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(
                        snap['datePublished'].toDate(),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Firestore_methods().likeComment(
                    snap['postId'],
                    snap['commentId'],
                    FirebaseAuth.instance.currentUser!.uid,
                    snap['likedby']);
              },
              icon: snap['likedby']
                      .contains(FirebaseAuth.instance.currentUser!.uid)
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border_outlined))
        ],
      ),
    );
  }
}
