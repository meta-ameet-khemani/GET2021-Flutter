import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
        centerTitle: true,
        // backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              // autovalidate: true,
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        validator: (name) {
                          if (name.isEmpty) return 'Name must not be empty';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: '* Required',
                          ),
                          EmailValidator(
                            errorText: 'Please enter valid email',
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                        ),
                        keyboardType: TextInputType.number,
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: '* Required',
                          ),
                          PatternValidator(
                            r"^\+?0[0-9]{10}$",
                            errorText: 'Please enter valid number',
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Secure Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "* Required";
                          } else if (value.length < 6) {
                            return "Password should be atleast 6 characters";
                          } else if (value.length > 15) {
                            return "Password should not be greater than 15 characters";
                          } else
                            return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (!(_formKey.currentState.validate()))
                            return 'Error';
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
