import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TextField example',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 5,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'Ameet Khemani',
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (name) => _name = name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 5,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: '*************',
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 5,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: '1234567890',
                  labelText: 'Contact No:',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 15,
            //   ),
            //   child: TextField(
            //     controller: _emailController,
            //     keyboardType: TextInputType.emailAddress,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         gapPadding: 5,
            //         borderRadius: BorderRadius.all(Radius.circular(5)),
            //       ),
            //       hintText: 'abc@mail.com',
            //       labelText: 'Email',
            //       labelStyle: TextStyle(
            //         fontSize: 25,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextFormField(
                validator: (value) {
                  Pattern pattern =
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$";
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value) || value == null)
                    return 'Enter a valid email address';
                  else
                    return null;
                },
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    gapPadding: 5,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  hintText: 'abc@mail.com',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                print(_name);
                print(_passwordController.text.toString());
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
