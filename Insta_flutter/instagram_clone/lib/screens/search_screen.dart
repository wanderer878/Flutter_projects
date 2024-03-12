import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/utils/colors.dart';

class SearchSc extends StatefulWidget {
  const SearchSc({super.key});

  @override
  State<SearchSc> createState() => _SearchScState();
}

class _SearchScState extends State<SearchSc> {
  bool searched = false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          decoration: InputDecoration(label: Text('Enter text  to search')),
          controller: _controller,
          onFieldSubmitted: (String value) {
            setState(() {
              searched = true;
            });
          },
        ),
      ),
      body: searched ? FutureBuilder(future: FirebaseFirestore.instance.collection("users").where("username",isGreaterThanOrEqualTo: _controller.text) .get(),
       builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
         if(snapshot.hasData){
           return ListView.builder(
             itemCount: snapshot.data!.docs.length,
             itemBuilder: (context, index) {
               return ListTile(
                 title: Text(snapshot.data!.docs[index].data()['username']),                                             
                 leading: CircleAvatar(
                   backgroundImage: NetworkImage(snapshot.data!.docs[index].data()['photo_url']),
                 ),
                 );
             },
           );
         }else{
           return Center(
             child: CircularProgressIndicator(),
           );
         }
       }) : Placeholder(),
    );
  }
}
