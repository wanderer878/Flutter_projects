import 'package:bloc_login_technique/bloc/Auth_bloc.dart';
import 'package:bloc_login_technique/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(home: LoginScreen()));
  }
}
