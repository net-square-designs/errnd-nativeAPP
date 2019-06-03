import 'package:errnd/app/api/auth_api.dart';
import 'package:errnd/app/components/button.dart';
import 'package:errnd/app/components/ui.dart';
import 'package:errnd/app/store.dart';
import 'package:errnd/app/utils/http.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences _sharedPreferences;
  var _authToken, _welcomeMes
      // ,_id, _name, _homeResponse
      ;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    // String authToken = Store.getToken(_sharedPreferences);
    // var id = _sharedPreferences.getInt(Store.userIdKey);
    // var name = _sharedPreferences.getString(Store.nameKey);
    var authToken = _sharedPreferences.getString(Store.authTokenKey);
    var welcomeMes = _sharedPreferences.getString(Store.loginMessage);

    UI.showSnackBarSuccess(_scaffoldKey, welcomeMes);
    // print(authToken);

    // _fetchHome(authToken);

    setState(() {
      _authToken = authToken;
      _welcomeMes = welcomeMes;
      // _id = id;
      // _name = name;
    });

    if (_authToken == null) {
      _logout();
    }
  }

  // _fetchHome(String authToken) async {
  //   var responseJson = await Http.fetch(authToken, '/api/v1/home');

  //   if (responseJson == null) {
  //     UI.showSnackBar(_scaffoldKey, 'Something went wrong!');
  //   } else if (responseJson == 'NetworkError') {
  //     UI.showSnackBar(_scaffoldKey, null);
  //   } else if (responseJson['errors'] != null) {
  //     _logout();
  //   }

  //   setState(() {
  //     // _homeResponse = responseJson.toString();
  //   });
  // }

  _logout() {
    Auth.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          backgroundColor: Colors.deepPurple[700],
          title: new Text('Errnd'),
        ),
        body: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0.0, 0.0),
                  child: Text('$_welcomeMes!',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontFamily: 'CircularStd')),
                ),
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    '$_authToken',
                    style: new TextStyle(
                        fontSize: 24.0, color: Colors.grey.shade700),
                  ),
                ),
                new CustomButton(
                  onPressed: _logout,
                  buttonName: 'Logout',
                ),
              ]),
        ));
  }
}
