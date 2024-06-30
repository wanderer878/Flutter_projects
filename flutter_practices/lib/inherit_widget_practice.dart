import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MystateWidget extends InheritedWidget {
  MystateWidget({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  int data;

  static MystateWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MystateWidget>();
  }

  @override
  bool updateShouldNotify(MystateWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class Widget1 extends StatefulWidget {
  Widget1({super.key});

  @override
  State<Widget1> createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  @override
  Widget build(BuildContext context) {
    var mydata = MystateWidget.of(context);
    mydata = null;
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited widget practice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mydata?.data.toString() ?? '40'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    mydata?.data = 50;
                    print(mydata?.data);
                  });
                },
                child: Text('increase'))
          ],
        ),
      ),
    );
  }
}
