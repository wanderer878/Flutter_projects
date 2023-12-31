import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class Login_Page extends StatefulWidget {
  Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();
  bool _loadingState = false;

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
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
                    height: 64,
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
                  FilledButton(
                      style: FilledButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          backgroundColor: blueColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      onPressed: Login,
                      child: _loadingState == false
                          ? Text('Login')
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            )),
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ? "),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup_sc()));
                        },
                        child: Text(
                          "Sign up",
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

  void Login() async {
    setState(() {
      _loadingState = true;
    });

    String res = await Auth_methods().signin(
        email: email_controller.text, password: password_controller.text);

    setState(() {
      _loadingState = false;
    });

    if (res != "success") {
      showSnackbar(res, context);
    }
  }
}
