import 'package:flutter/material.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final String content;
  final Function callBack;
  final IconData icon;
  const SocialMediaLoginButton({
    Key? key,
    required this.icon,
    required this.content,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: callBack as void Function()?,
            // () {
            //   final provider =
            //       Provider.of<AuthProvider>(context, listen: false);
            //   provider.googleLoginIn();
            // },
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
