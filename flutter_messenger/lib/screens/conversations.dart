import 'package:flutter/material.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Chats'),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/11.jpg'),
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
        )
      ],
    ));
  }
}
