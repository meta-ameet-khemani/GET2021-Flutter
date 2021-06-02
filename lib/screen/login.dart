import 'package:flutter/material.dart';
import '../component/social_media_login_button.dart';
import '../provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final scaffoldKey;
  const Login(this.scaffoldKey, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaLoginButton(
              icon: Icons.golf_course,
              content: 'Sign In With Google',
              callBack: () {
                final provider =
                    Provider.of<AuthProvider>(context, listen: false);
                provider.googleLoginIn();
              },
            ),
            RaisedButton(
              onPressed: () {
                final provider =
                    Provider.of<AuthProvider>(context, listen: false);
                provider.simpleLogin("test@test.com", 'test12');
              },
              child: Text('Sign In With Correct Email and Password'),
            ),
            RaisedButton(
              onPressed: () async {
                final provider =
                    Provider.of<AuthProvider>(context, listen: false);
                final result =
                    await provider.simpleLogin("test@test.com1", 'test122');
                if (!result) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid Email/Password.'),
                    ),
                  );
                }
              },
              child: Text('Sign In With In-Correct Email and Password'),
            ),
          ],
        ),
      ),
    );
  }
}
