import 'package:flutter/material.dart';

class UserInfo {
  String? username;
  String? sex;
  int? age;

  UserInfo();
}

class GlobalNotifier extends ChangeNotifier {
  UserInfo? _userInfo = UserInfo();

  UserInfo? get user => _userInfo;

  set user(UserInfo? newValue) {
    _userInfo = newValue;
    notifyListeners();
  }
}
