import 'package:flutter_bloc/flutter_bloc.dart';

class bloc_observer extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('observer $bloc $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print('observer ${bloc.runtimeType} $error');
  }
}
