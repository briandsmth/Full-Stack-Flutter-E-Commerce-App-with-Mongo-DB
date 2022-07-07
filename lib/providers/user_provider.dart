import 'package:e_commerce_app/models/user_.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      email: '',
      id: '',
      name: '',
      password: '',
      address: '',
      type: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
