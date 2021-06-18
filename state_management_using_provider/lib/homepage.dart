import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_using_provider/user_model.dart';
import 'package:state_management_using_provider/user_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).setUser(
                User(
                  age: '34',
                  name: 'asdf',
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.access_alarms),
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).setUser(null);
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return userProvider.getUser == null
                  ? Text('userProvider.getUser.name')
                  : Text(userProvider.getUser.name);
            },
          ),
        ),
      ),
    );
  }
}
