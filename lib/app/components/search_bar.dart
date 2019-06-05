import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        elevation: 2.0,
        shadowColor: Colors.grey,
        child: new TextFormField(
          cursorColor: Colors.deepPurple[500],
          decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey[200], width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey[200], width: 2),
            ),
            prefixIcon: new Icon(
              Icons.search,
              color: Colors.deepPurple[500],
            ),
            hintText: "Search for Services and Runners",
            hintStyle: TextStyle(color: Colors.grey[350], fontSize: 16),
            fillColor: Colors.black,
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(),
        ));
  }
}
