import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferenceExample extends StatefulWidget {
  @override
  _MySharedPreferenceExampleState createState() =>
      _MySharedPreferenceExampleState();
}

class _MySharedPreferenceExampleState extends State<MySharedPreferenceExample> {
  SharedPreferences? sharedPreferences;

  Future<void> initialiseSharedPreferences() async {
    this.sharedPreferences = await SharedPreferences.getInstance();
    this.sharedPreferences!.setString('name', 'Ameet Khemani');
  }

  Future<void> add(String key, String value, {bool isEdit = false}) async {
    if (this.sharedPreferences != null) {
      // isEdit ? print('To Update') : print('To Add');
      if (isEdit) {
        await this.sharedPreferences!.setString(key, value);
      } else {
        await this.sharedPreferences!.setString(key, value);
      }
      setState(() {});
    }
  }

  // void update(String key, String value) {
  //   if (this.sharedPreferences != null) {
  //     this.sharedPreferences.setString(key, value);
  //   }
  // }

  String convertPerson(Person person) {
    return jsonEncode(person.toMap());
  }

  void delete(String key) {
    if (this.sharedPreferences != null) {
      this.sharedPreferences!.remove(key);
    }
    setState(() {});
  }

  @override
  void initState() {
    initialiseSharedPreferences().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    add(
        'person',
        convertPerson(
            Person(name: 'John Doe', age: 35, address: 'California')));
    Person? person = this.sharedPreferences == null
        ? null
        : Person.fromJson(
            jsonDecode(this.sharedPreferences!.getString('person')!));
    final name = this.sharedPreferences?.getString('name');
    final phone = this.sharedPreferences?.getString('phone');
    String centerText = 'name : $name \n person.name ${person?.name}';
    centerText = phone == null ? centerText : centerText + '\nphone: $phone';
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              centerText,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: SingleChildScrollView(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  add('phone', 'Iphone 11');
                },
                tooltip: 'Increment',
                child: Icon(
                  Icons.add,
                  size: 32,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  add('name', 'John', isEdit: true);
                },
                tooltip: 'Update',
                child: Icon(Icons.edit),
              ),
              FloatingActionButton(
                onPressed: () {
                  add('name', 'John Doe', isEdit: true);
                },
                tooltip: 'Refresh',
                child: Icon(
                  Icons.refresh,
                  size: 30,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  delete('phone');
                },
                tooltip: 'Delete',
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Person {
  String? name;
  int? age;
  String? address;

  Person({this.name, this.age, this.address});

  factory Person.fromJson(Map<String, dynamic> personMap) {
    return Person(
      name: personMap['name'],
      age: personMap['age'],
      address: personMap['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age, 'address': address};
  }
}
