import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  Uint8List? _file;
  TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Choose an option"),
            children: [
              SimpleDialogOption(
                child: Text("Take a photo"),
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                child: Text("Choose from Gallery"),
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                padding: EdgeInsets.all(20),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  
  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User_provider>(context).get_user;

    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () => _selectImage(context),
                icon: Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              title: Text("Post to"),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(user.photo_url)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller:  _descriptionController,
                        maxLines: 8,
                        decoration: InputDecoration(
                          hintText: 'Write a caption...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }
}
