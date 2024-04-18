import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:provider/provider.dart';

class responsive_layout extends StatefulWidget {
  final Widget MobileScreenLayout;
  final Widget WebScreenLayout;

  const responsive_layout(
      {super.key,
      required this.MobileScreenLayout,
      required this.WebScreenLayout});

  @override
  State<responsive_layout> createState() => _responsive_layoutState();
}

class _responsive_layoutState extends State<responsive_layout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    await Provider.of<User_provider>(context, listen: false).refreshuser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return widget.WebScreenLayout;
      }
      return widget.MobileScreenLayout;
    });
  }
}
