import 'package:flutter/material.dart';

import 'user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  User get getUser => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void changeName() {
    _user.name = 'asdf';
    notifyListeners();
  }
}
