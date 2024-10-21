import 'package:bloc/bloc.dart';

sealed class events {}

class Increment_Handler extends events {}

class Decrement_Handler extends events {}

class BlocCounter extends Bloc<events, int> {
  BlocCounter(int initialState) : super(initialState) {
    on<Increment_Handler>((event, emit) {
      emit(state + 1);
    });
    on<Decrement_Handler>((event, emit) {
      emit(state > 0 ? state - 1 : state);
    });
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
