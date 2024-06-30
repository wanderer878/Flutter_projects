

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MystateWidget extends InheritedWidget {
  const MystateWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child) ;

  final int data;

  static MystateWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MystateWidget>();
  }
  
  @override
  bool updateShouldNotify( MystateWidget oldWidget) {
    return oldWidget.data != data;
  }
  
}

class Widget1 extends StatelessWidget {
   Widget1({super.key});
  
  @override
  Widget build(BuildContext context) {
    final mydata = MystateWidget.of(context)?.data ?? 9;
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited widget practice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mydata.toString()),
          ],
        ),
      ),
    );
  }
}