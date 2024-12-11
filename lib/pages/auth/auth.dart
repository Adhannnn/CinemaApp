import 'package:cinema_application/pages/accountflow/db_accounthelper.dart';
import 'package:cinema_application/pages/dbhelper.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  Map<String, dynamic>? _userDetails;

  bool get isLoggedIn => _isLoggedIn;
  Map<String, dynamic>? get userDetails => _userDetails;

  // Function to check login status (you can call this when the app starts or during navigation)
  void checkLoginStatus() async {
    String? lastLoginEmail = await AccountHelper().getLastLoginAccount();

    if (lastLoginEmail != null) {
      final user = await DatabaseHelper().getUserByEmail(lastLoginEmail);
      if (user != null) {
        _isLoggedIn = true;
        _userDetails = user;
      } else {
        _isLoggedIn = false;
        _userDetails = null;
      }
    } else {
      _isLoggedIn = false;
      _userDetails = null;
    }
    notifyListeners();
  }
}
