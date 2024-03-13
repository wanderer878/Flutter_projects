import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      body: searched
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("users")
                  .where("username", isGreaterThanOrEqualTo: _controller.text)
                  .get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(snapshot.data!.docs[index].data()['username']),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!.docs[index].data()['photo_url']),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
          : FutureBuilder(
              future: FirebaseFirestore.instance.collection("posts").get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MasonryGridView.count(
                     crossAxisCount: 3,
                     itemCount: snapshot.data!.docs.length,
                     itemBuilder: (context,index)=> Image.network(
                       snapshot.data!.docs[index]['post_url'],
                       fit: BoxFit.contain,
                     ),
                     mainAxisSpacing: 8.0,
                     crossAxisSpacing: 8.0,),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
    );
  }
}
