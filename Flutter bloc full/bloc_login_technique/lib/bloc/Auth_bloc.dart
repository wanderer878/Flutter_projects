import 'package:bloc_login_technique/bloc/Auth_bloc_Event.dart';
import 'package:bloc_login_technique/bloc/Auth_bloc_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(AuthInitialStates()) {
    on<onPressed>((event, emit) {});
  }
}
