import 'package:flutter/material.dart';

class UI {
  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

  static showSnackBarSuccess(
      GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.deepPurple[700],
      content: new Text(message ?? 'Success'),
    ));
  }
}
