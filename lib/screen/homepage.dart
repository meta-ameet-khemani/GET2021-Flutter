import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Logged In Page'),
          SizedBox(
            height: 20,
          ),
          (user != null && user.photoURL != null)
              ? CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                )
              : Text(''),
          SizedBox(
            height: 20,
          ),
          user != null ? Text('${user.displayName}') : Text(''),
          user != null ? Text('${user.phoneNumber}') : Text(''),
          user != null ? Text('${user.emailVerified}') : Text(''),
          user != null ? Text('${user.uid}') : Text(''),
          SizedBox(
            height: 20,
          ),
          user != null ? Text('${user.email}') : Text(''),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              final provider =
                  Provider.of<AuthProvider>(context, listen: false);
              provider.logOut();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
