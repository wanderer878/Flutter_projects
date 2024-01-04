import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class User_provider extends ChangeNotifier {
  User? _user;

  get get_user => _user!;

  Future<void> refreshuser() async {
    _user = await Auth_methods().getUserdetails();

    notifyListeners();
  }
}
