import 'package:bloc_counter_app/bloc_counter.dart';
import 'package:bloc_counter_app/cubit_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecCubit extends StatelessWidget {
  const IncDecCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CubitCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: cubit.increment, child: Text('increment')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: cubit.decrement, child: Text('decrement'))
        ]),
      ),
    );
  }
}

class IncDecBloc extends StatelessWidget {
  const IncDecBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                bloc.add(Increment_Handler());
              },
              child: Text('increment')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                bloc.add(Decrement_Handler());
              },
              child: Text('decrement'))
        ]),
      ),
    );
  }
}
