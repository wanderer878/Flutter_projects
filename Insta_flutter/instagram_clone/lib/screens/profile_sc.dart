import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/Followbutton.dart';

class Profile_sc extends StatefulWidget {
  const Profile_sc({super.key});

  @override
  State<Profile_sc> createState() => _Peofile_scState();
}

class _Peofile_scState extends State<Profile_sc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("username"),
        backgroundColor: mobileBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatColumn(30, "posts"),
                          buildStatColumn(160, "followers"),
                          buildStatColumn(10, "following"),
                        ],
                      ),
                      Followbutton(
                        backgroundColor: mobileBackgroundColor,
                        bordercolor : primaryColor,
                        text: "Edit profile",
                        txtclr: Colors.grey,
                        function: (){},
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              alignment: Alignment.centerLeft,
              child: Text("Username", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              padding: EdgeInsets.only(top: 1),
              alignment: Alignment.centerLeft,
              child: Text("Some description"),
            )
          ],
        ),
      ),
    );
  }

  Column buildStatColumn(int num , String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}