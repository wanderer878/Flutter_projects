import 'package:bloc_counter_app/cubit_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final CubitCounter cubit = CubitCounter(0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<CubitCounter, int>(
              bloc: cubit,
              builder: (context, counter) {
                return Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 40),
                );
              }),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: cubit.increment, child: Text('increment')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: cubit.decrement, child: Text('decrement'))
        ])),
      ),
    );
  }
}
