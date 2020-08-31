import 'package:flutter/material.dart';

  class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 120.0, horizontal: 40.0),
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 30.0,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey[200]),
                      hintText: 'Enter your email',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                      ),
                    ),
                    validator: (value) {
                      /*if (value.isEmpty) {
                        return 'Please enter some text';
                      }*/
                      return null;
                    },
                    onChanged: (String value) {
                      username = value;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[200]),
                          hintText: 'Enter your password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]),
                          )),
                      validator: (value) {
                        /*if (value.isEmpty) {
                        return 'Please enter some text';
                        }*/
                        return null;
                      },
                      onChanged: (String value) {
                        password = value;
                      },
                      obscureText: true),
                  SizedBox(
                    height: 80.0,
                  ),
                  RaisedButton(
                    color: Colors.grey[900],
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // Process data.
                        Navigator.pushNamed(context, '/home', arguments: {
                          'username': username,
                        });
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
