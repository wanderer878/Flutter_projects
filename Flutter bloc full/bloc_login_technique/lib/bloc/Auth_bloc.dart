import 'package:bloc_login_technique/bloc/Auth_bloc_Event.dart';
import 'package:bloc_login_technique/bloc/Auth_bloc_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthInitialState()) {
    on<onPressed>((event, emit) async {
      try {
        if (event.email.isEmpty || event.password.isEmpty) {
          return emit(AuthFailedState(
            error: 'Email and password cannot be empty',
          )); /* return means we are not returning
                                          something from void function but just 
                                          exiting the function. */
        } else {
          await Future.delayed(Duration(seconds: 2), () {
            return emit(AuthSuccessState());
          });
        }
      } catch (e) {
        emit(AuthFailedState(error: e.toString()));
      }
    });
  }
}
