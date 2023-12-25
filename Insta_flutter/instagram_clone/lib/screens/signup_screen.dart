import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class Signup_sc extends StatefulWidget {
  const Signup_sc({super.key});

  @override
  State<Signup_sc> createState() => _Signup_scState();
}

class _Signup_scState extends State<Signup_sc> {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();
  final TextEditingController username_controller = new TextEditingController();
  final TextEditingController bio_controller = new TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  void select_image() async {
    Uint8List i_list = await pickImage(ImageSource.gallery);
    setState(() {
      _image = i_list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),
                  SvgPicture.asset(
                    "assets/ic_instagram.svg",
                    height: 61,
                    color: primaryColor,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1702966051138-009c0c965295?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8')),
                      Positioned(
                        child: IconButton(
                            onPressed: () {
                              select_image();
                            },
                            icon: Icon(Icons.add_a_photo)),
                        bottom: -10,
                        left: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldInput(
                      T_controller: username_controller,
                      hint_text: 'Enter username',
                      key_type: TextInputType.text),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldInput(
                      T_controller: email_controller,
                      hint_text: 'Enter email address',
                      key_type: TextInputType.emailAddress),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldInput(
                    T_controller: password_controller,
                    hint_text: 'Enter Password',
                    key_type: TextInputType.text,
                    isPass: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFieldInput(
                      T_controller: bio_controller,
                      hint_text: 'Enter your bio',
                      key_type: TextInputType.text),
                  SizedBox(
                    height: 30,
                  ),
                  FilledButton(
                      style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        backgroundColor: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                      onPressed: () async {
                        String res = await Auth_methods().signup(
                            username: username_controller.text,
                            password: password_controller.text,
                            email: email_controller.text,
                            bio: bio_controller.text);

                        print(res);
                      },
                      child: Text('Sign up')),
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("already have an account ? "),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ))),
    );
  }
}
