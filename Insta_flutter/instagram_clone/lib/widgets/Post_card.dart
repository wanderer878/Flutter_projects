import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({super.key, required this.snap});

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
                  backgroundImage: NetworkImage(snap['profImage']),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snap['username'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shrinkWrap: true,
                                  children: ["Delete"]
                                      .map((e) => GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 16),
                                              child: Text(e),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ));
                    },
                    icon: Icon(Icons.more_vert))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              snap['post_url'],
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
              ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    child: Text(
                      "${snap['likes'].length} likes",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 8),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: primaryColor),
                              children: [
                            TextSpan(
                                text: snap['username'],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: "  ${snap['description']}",
                            ),
                          ]))),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "View all comments",
                        style: TextStyle(color: secondaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMd().format(snap['datePublished'].toDate()),
                      style: TextStyle(color: secondaryColor, fontSize: 16),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
