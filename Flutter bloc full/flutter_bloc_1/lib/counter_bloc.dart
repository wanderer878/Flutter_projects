import 'package:flutter_bloc/flutter_bloc.dart';

sealed class events {}

final class onPressed extends events {}

final class onHeld extends events {}

class CounterBloc extends Bloc<events, int> {
  CounterBloc(int initial_state) : super(initial_state) {
    on<onPressed>(
      (event, emit) => emit(state + 1),
    );

    on<onHeld>((event, emit) => emit(state - 1));
  }
}
