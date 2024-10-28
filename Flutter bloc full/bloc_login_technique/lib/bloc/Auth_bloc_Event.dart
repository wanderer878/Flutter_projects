sealed class AuthBlocEvent {}

class onPressed extends AuthBlocEvent {
  final String email;
  final String password;

  onPressed({required this.email, required this.password});
}
