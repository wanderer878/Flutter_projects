import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://cdn.cloudflare.steamstatic.com/steam/apps/377160/ss_f7861bd71e6c0c218d8ff69fb1c626aec0d187cf.1920x1080.jpg?t=1650909928'),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
            ),
          )
        ],
      ),
    );
  }
}
