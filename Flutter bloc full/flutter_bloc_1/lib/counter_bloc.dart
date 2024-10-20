import 'package:flutter_bloc/flutter_bloc.dart';

class Counter_bloc extends Cubit<int> {
  Counter_bloc(int initialState) : super(initialState);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}
