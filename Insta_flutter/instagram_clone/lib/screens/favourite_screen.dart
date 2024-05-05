import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fav_sc extends StatelessWidget {
  const Fav_sc({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    /*return Scaffold(
      appBar: AppBar(title: Text('Saved_posts'),),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(Firebase).get(),
        builder: (BuildContext, AsyncSnapshot<Map<String,dynamic>> snapshot){
         s
      }),
    )*/
  }
}
