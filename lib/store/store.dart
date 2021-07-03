import 'package:flutter/material.dart';
import 'package:minibr/models/user.dart';

class Store with ChangeNotifier {
  User? _user;
  bool _isDark = false;

  User? get user => _user;
  bool get isDark => _isDark;

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
