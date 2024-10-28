sealed class AuthBlocState {}

class AuthInitialState extends AuthBlocState {}

class AuthFailedState extends AuthBlocState {
  final String error;

  AuthFailedState({required this.error});
}

class AuthSuccessState extends AuthBlocState {}
