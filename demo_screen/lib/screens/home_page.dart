import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/model/home_page.dart';

class HomePage extends StatefulWidget {
  final String? title;
  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _locations = [
    'Jodhpur',
    'Ahmedabad',
    'Mohali',
    'Jaipur',
    'Delhi'
  ];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String? _workPlace;
  String? _noOfPersons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title!),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildInputField(
                  controller: _nameController, icon: Icons.edit, title: 'Name'),
              buildInputField(
                controller: _phoneController,
                icon: Icons.contact_phone,
                title: 'Phone No',
                type: TextInputType.number,
              ),
              buildDropDown(
                icon: Icons.location_on_sharp,
                valueToSave: _workPlace,
                title: "Prefered location",
                items: _locations,
                submitChanges: (value) {
                  setState(() {
                    _workPlace = value;
                  });
                },
              ),
              buildDropDown(
                icon: Icons.person,
                valueToSave: _noOfPersons,
                title: "Persons you would adjust with",
                items: ['1', '2', '3', '4', '5'],
                submitChanges: (value) {
                  setState(() {
                    _noOfPersons = value;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  print(HomePageModel(
                    name: _nameController.text,
                    contact: _phoneController.text,
                    location: _workPlace,
                    noOfPersons: _noOfPersons,
                  ));
                },
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDropDown({
    IconData? icon,
    String? valueToSave,
    required String title,
    required List<String> items,
    final Function? submitChanges,
  }) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 100,
      width: screenSize.width,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              child: Icon(icon),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: DropdownButton<String>(
                value: valueToSave,
                elevation: 5,
                style: TextStyle(color: Colors.black),
                items: items.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onChanged: (String? value) => submitChanges!(value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildInputField(
      {TextEditingController? controller,
      String? title,
      IconData? icon,
      TextInputType? type}) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 100,
      width: screenSize.width,
      child: Align(
        child: TextField(
          keyboardType: type != null ? type : TextInputType.name,
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(icon),
            hintText: title,
            hintStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
