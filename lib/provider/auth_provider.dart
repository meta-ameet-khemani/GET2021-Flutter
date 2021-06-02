import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user;

  GoogleSignInAccount get getUser => _user;

  bool isSimpleLogin = false;

  Future googleLoginIn() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    // print('access token ${googleAuth.accessToken}');
    // print('id token ${googleAuth.idToken}');
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    this.isSimpleLogin = false;
    notifyListeners();
  }

  Future<bool> simpleLogin(String email, String password) async {
    try {
      // print('Trying to login through email password');
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Result $result');
      // _user = result.user as GoogleSignInAccount;
      if (result.user == null) return false;
      this.isSimpleLogin = true;
      notifyListeners();
      return true;
    } catch (error) {
      print('Error in fetching user through email and password');
      print(error.toString());
      return false;
    }
  }

  Future logOut() async {
    if (!this.isSimpleLogin) {
      await googleSignIn.disconnect();
    }
    FirebaseAuth.instance.signOut();
  }
}
