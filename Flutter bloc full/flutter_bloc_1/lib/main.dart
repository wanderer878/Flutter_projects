import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc_observer.dart';
import 'package:flutter_bloc_1/counter_bloc.dart';
import 'package:flutter_bloc_1/counter_cubit.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //streams();
    bloc();
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }

  Future<void> streams() async {
    Bloc.observer = bloc_observer();
    Counter_cubit cb = Counter_cubit(0);
    final Subscription = cb.stream.listen(print);
    cb.increment();
    await Future.delayed(Duration.zero);
    await Subscription.cancel();
    await cb.close();
  }

  Future<void> bloc() async {
    Bloc.observer = bloc_observer();
    CounterBloc bloc = CounterBloc(0);
    print(bloc.state);
    bloc.add(onPressed());
    await Future.delayed(Duration.zero);
    print(bloc.state);
    bloc.close();
  }
}
