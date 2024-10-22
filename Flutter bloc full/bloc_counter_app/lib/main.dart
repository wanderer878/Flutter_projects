import 'package:bloc_counter_app/bloc_counter.dart';
import 'package:bloc_counter_app/cubit_counter.dart';
import 'package:bloc_counter_app/inc_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => CubitCounter(0)),
    BlocProvider(create: (_) => BlocCounter(0)),
  ], child: MainApp()));

  //runApp(BlocProvider(create: (_) => BlocCounter(0), child: MainApp()));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  Homescreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocCounter>(context);
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocBuilder<BlocCounter, int>(
            //bloc: bloc,
            builder: (context, counter) {
          return Text(
            counter.toString(),
            style: TextStyle(fontSize: 40),
          );
        }),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (cotext) => IncDecBloc()));
            },
            child: Text('functions')),
      ])),
    );
  }
}
