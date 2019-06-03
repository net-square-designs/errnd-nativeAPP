import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final String emailError;
  EmailField({this.emailController, this.emailError});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        child: new Theme(
            data: new ThemeData(
                primaryColor: Colors.deepPurple[700],
                textSelectionColor: Theme.of(context).primaryColor),
            child: new TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: new InputDecoration(
                  errorText: emailError,
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'CircularStd',
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ))));
  }
}
