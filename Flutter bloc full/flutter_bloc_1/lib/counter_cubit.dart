import 'package:flutter_bloc/flutter_bloc.dart';

class Counter_cubit extends Cubit<int> {
  Counter_cubit(int initialState) : super(initialState);

  void increment() {
    addError('increment error ', StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
