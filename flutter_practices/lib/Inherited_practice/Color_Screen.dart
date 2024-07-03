import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inherit_class extends InheritedWidget {
  Inherit_class({required this.color, required this.function, required super.child});

  final Color color;
  final void Function() function;

  static Inherit_class? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Inherit_class>();
  }

  @override
  bool updateShouldNotify(Inherit_class oldWidget) {
    return oldWidget.color != color;
  }
  
} 

class Color_inherit extends StatefulWidget {
  const Color_inherit({super.key});

  @override
  State<Color_inherit> createState() => _Color_inheritState();
}

class _Color_inheritState extends State<Color_inherit> {

  Color _color = Colors.blue.shade100;
    void ColorChange(){
      setState(() {
        _color = Colors.green;
      });
    }
  @override
  Widget build(BuildContext context) {
    
    return Inherit_class(
      color:  _color,
      function:  ColorChange,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Color Inherit Practice"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorWidget(),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                ColorChange();
              }, child: Text("green color"))
            ],
          ),
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Inherit_class.of(context)!.color,
      height: 150,
      width: 150,
    );
  }
}