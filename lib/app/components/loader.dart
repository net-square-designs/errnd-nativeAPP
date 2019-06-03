import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String loadingMessage;

  Loader({this.loadingMessage});

  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(top: 100.0),
        child: new Center(
            child: new Column(
          children: <Widget>[
            new CircularProgressIndicator(strokeWidth: 4.0),
            new Container(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                loadingMessage ?? '',
                style:
                    new TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
              ),
            )
          ],
        )));
  }
}
