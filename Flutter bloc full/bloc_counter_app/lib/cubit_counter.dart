import 'package:bloc/bloc.dart';

class CubitCounter extends Cubit<int> {
  CubitCounter(int initialState) : super(initialState);

  void increment() => emit(state + 1);
  void decrement() => emit(state > 0 ? state - 1 : state);
}
