import 'package:flutter/material.dart';

class CompanyInfo {
  String? name;
  String? id;
  String? createTime;

  CompanyInfo();
}

class GlobalNotifier2 extends ChangeNotifier {
  CompanyInfo? _company = CompanyInfo();

  CompanyInfo? get company => _company;

  set company(CompanyInfo? newValue) {
    _company = newValue;
    notifyListeners();
  }
}