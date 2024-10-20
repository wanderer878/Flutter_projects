import 'package:flutter/material.dart';
import 'package:flutter_bloc_1/counter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    streams();
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }

  Future<void> streams() async {
    Counter_bloc cb = Counter_bloc(0);
    final Subscription = cb.stream.listen(print);
    cb.increment();
    await Future.delayed(Duration.zero);
    await Subscription.cancel();
    await cb.close();
  }
}
