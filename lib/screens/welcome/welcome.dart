import 'package:flutter/material.dart';
import '../../screens/home/home_screen.dart';
import 'components/top_banner.dart';
import 'components/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBanner(),
          WelcomeButton(
            letsGO: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
