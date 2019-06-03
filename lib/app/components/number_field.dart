import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  final TextEditingController numberController;
  final String numberError;
  final String labelName;
  NumberField({this.numberController, this.numberError, this.labelName});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        child: new Theme(
            data: new ThemeData(
                primaryColor: Colors.deepPurple[700],
                textSelectionColor: Theme.of(context).primaryColor),
            child: new TextField(
                keyboardType: TextInputType.number,
                controller: numberController,
                decoration: new InputDecoration(
                  hintText: labelName,
                  hintStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'CircularStd',
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  errorText: numberError,
                ))));
  }
}
//  keyboardType: TextInputType.phone
