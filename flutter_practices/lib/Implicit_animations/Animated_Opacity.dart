import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animated_Opacity extends StatefulWidget {
  const Animated_Opacity({super.key});

  @override
  State<Animated_Opacity> createState() => _Animated_OpacityState();
}

class _Animated_OpacityState extends State<Animated_Opacity> {
  double _Opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated opacity practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Guess the animal",style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height:  15),
            Text("No Sweet Tooth"),
            Text("Head Level Chasers"),
            Text("Hairball Terminology"),
            Text("Group Names"),
            Text("Tree Descents"),
            SizedBox(height:  15),
            ElevatedButton(onPressed: (){
              setState(() {
                _Opacity = 1;
              });
            }, child: Text("Show Animal !")),
            SizedBox(height: 20,),
            AnimatedOpacity(opacity: _Opacity, duration: Duration(seconds: 2),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network("https://images.theconversation.com/files/566193/original/file-20231218-23-agqln9.jpg?ixlib=rb-4.1.0&q=45&auto=format&w=600&h=399&fit=crop&dpr=1",fit: BoxFit.contain,),
            )   ,)
            
          ],
          
        ),
            ),
      ),
    );
     
  }
}