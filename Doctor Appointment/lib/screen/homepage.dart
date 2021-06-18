import 'dart:math';
import '../provider/login_logout_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateFormat format = DateFormat('dd/MM/yyyy');
  DateTime? _todaysDate;
  String? _todaysDateString;
  List<User> _users = [];
  List<User> _finalUsers = [];

  @override
  void initState() {
    super.initState();
    _todaysDate = DateTime.now();
    _todaysDateString = format.format(DateTime.now());
    _users = List.generate(15, (index) {
      return User(
        image: 'assets/$index.jpg',
        date: format
            .format(DateTime.now().add(Duration(days: Random().nextInt(7)))),
      );
    });
    filterUsers(_todaysDateString);
  }

  void filterUsers(String? todaysDate) {
    _finalUsers = _users.where((user) => user.date == todaysDate).toList();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            await Provider.of<LoginLogoutProvider>(context, listen: false)
                .setLogin(
              false,
              user: null,
            );
          },
        ),
        title: Text('Patient List $_todaysDateString'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: _todaysDate!,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 6)),
              );
              if (pickedDate != null && _todaysDate != pickedDate) {
                setState(() {
                  _todaysDate = pickedDate;
                  _todaysDateString = format.format(_todaysDate!);
                  filterUsers(_todaysDateString);
                });
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 1))
                .then((value) => _finalUsers),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  print((snapshot.data as List<User>).length);
                  return ListView.builder(
                    itemCount: _finalUsers.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(9),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  _finalUsers[index].image!,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          // CircleAvatar(
                          //   backgroundColor: Colors.transparent,
                          //   backgroundImage: AssetImage(images[index]),
                          //   minRadius: 10,
                          //   maxRadius: 30,
                          //   // child: Image.asset(
                          //   //   images[index],
                          //   //   fit: BoxFit.cover,
                          //   // ),
                          // ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_finalUsers[index].date!),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.done),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      color: Colors.green[300],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.close),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.rectangle,
                                      color: Colors.red[300],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }
              return Center(
                child: Text('Try again after some time'),
              );
            },
          ),
          // ListView.builder(
          //   itemCount: _finalUsers.length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //       elevation: 5,
          //       margin: EdgeInsets.all(9),
          //       child: ListTile(
          //         leading: Container(
          //           alignment: Alignment.centerLeft,
          //           width: 50,
          //           height: 50,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //               image: AssetImage(
          //                 _finalUsers[index].image,
          //               ),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //         // CircleAvatar(
          //         //   backgroundColor: Colors.transparent,
          //         //   backgroundImage: AssetImage(images[index]),
          //         //   minRadius: 10,
          //         //   maxRadius: 30,
          //         //   // child: Image.asset(
          //         //   //   images[index],
          //         //   //   fit: BoxFit.cover,
          //         //   // ),
          //         // ),
          //         title: Text(_finalUsers[index].date),
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
