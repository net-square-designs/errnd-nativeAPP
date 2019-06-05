import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  CustomButton({this.onPressed, this.buttonName});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 50.0,
        width: 300.0,
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: new Material(
            shadowColor: Colors.grey,
            elevation: 5.0,
            child: new MaterialButton(
                color: Colors.deepPurple[700],
                height: 42.0,
                child: new Text(buttonName,
                    style: new TextStyle(color: Colors.white)),
                onPressed: onPressed)));
  }
}

// new Container(
//   padding: const EdgeInsets.all(8.0),
//   child: new Text(
//     '$_authToken',
//     style: new TextStyle(
//         fontSize: 24.0, color: Colors.grey.shade700),
//   ),
// ),

// new CustomButton(
//   onPressed: _logout,
//   buttonName: 'Logout',
// ),
