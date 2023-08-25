import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => counter(),
    child: const MainApp(),
  ));
}

class counter extends ChangeNotifier {
  int tick = 0;

  void inc_tick() {
    tick++;
    notifyListeners();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter App with change notifier provider',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<counter>(builder: (context, count, child) {
                return Text(count.tick.toString());
              }),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<counter>(context, listen: false).inc_tick();
                  },
                  child: Text("increase"))
            ],
          ),
        ),
      ),
    );
  }
}
