import 'package:bloc_login_technique/bloc/Auth_bloc.dart';
import 'package:bloc_login_technique/bloc/Auth_bloc_Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(onPressed());
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
