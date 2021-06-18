import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLogoutProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userDetails;

  bool get loggedIn => _isLoggedIn;

  String? get user => _userDetails;

  Future<void> setLogin(bool loginStatus, {String? user}) async {
    _isLoggedIn = loginStatus;
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    if (user != null) {
      _userDetails = user;
      final isSaved = await _sharedPreferences.setString('user', user);
      print('isSaved $isSaved');
    } else {
      final isLogout = await _sharedPreferences.remove('user');
      _userDetails = null;
      print('isLogout $isLogout');
    }
    notifyListeners();
  }
}
