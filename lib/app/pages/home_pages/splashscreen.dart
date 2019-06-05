import 'dart:async';

import 'package:errnd/app/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config.dart' as config;

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final int splashDuration = config.splashScreenDuration;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;

  startTime() async {
    return Timer(Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      // Navigator.of(context).pushReplacementNamed('/login');
      _fetchSessionAndNavigate();
    });
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = Store.getToken(_sharedPreferences);
    if (authToken != null) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else if (authToken == null) {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: AppBar(title: Text('Errnd')),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0.0, 400.0, 0.0, 0.0),
                child: new Image.asset(
                  'lib/app/assets/logo.png',
                  width: 90,
                  height: 60,
                  alignment: Alignment.center,
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(140.0, 380.0, 0.0, 0.0),
                //   child: Text('Errnd',
                //       style: TextStyle(
                //           fontSize: 40.0,
                //           fontWeight: FontWeight.normal,
                //           color: Colors.black,
                //           fontFamily: 'Roboto')),
                // ),
              ),
            ]));
  }
}
