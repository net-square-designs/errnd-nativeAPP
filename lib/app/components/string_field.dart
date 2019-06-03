import 'package:flutter/material.dart';

class StringField extends StatelessWidget {
  final TextEditingController stringController;
  final String stringError;
  final String labelName;
  StringField({this.stringController, this.stringError, this.labelName});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        child: new Theme(
            data: new ThemeData(
                primaryColor: Colors.deepPurple[700],
                textSelectionColor: Theme.of(context).primaryColor),
            child: new TextField(
                keyboardType: TextInputType.text,
                controller: stringController,
                decoration: new InputDecoration(
                  hintText: labelName,
                  hintStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'CircularStd',
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  errorText: stringError,
                ))));
  }
}
//  keyboardType: TextInputType.phone
