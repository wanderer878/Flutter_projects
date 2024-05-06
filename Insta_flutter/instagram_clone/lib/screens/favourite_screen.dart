import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
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
    print(user.userId);
    return Scaffold(
      appBar: AppBar(title: Text('Saved_posts'),),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("users").doc(user.userId).snapshots(), 
      builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot){
       if (snapshot.connectionState == ConnectionState.waiting) {
         return Center(
          child: CircularProgressIndicator(),
         );
       }
       return Text("hello");
      })
    );
  }
}
