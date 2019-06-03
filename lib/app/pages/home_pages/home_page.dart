import 'package:errnd/app/api/auth_api.dart';
import 'package:errnd/app/components/button.dart';
import 'package:errnd/app/components/topnav.dart';
import 'package:errnd/app/components/ui.dart';
import 'package:errnd/app/store.dart';
import 'package:errnd/app/utils/http.dart';
import 'package:flutter/cupertino.dart';
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

  Widget _appBar() {
    return new AppBar(
      title: Text(
        'errnd',
        style: TextStyle(
          color: Colors.deepPurple[500],
          fontSize: 30.0,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.deepPurple[500], size: 100.0),
      centerTitle: true,
      elevation: 0,
      brightness: Brightness.light,
      bottomOpacity: 0,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _sideBar() {
    return new Drawer(
      elevation: 16,
      child: new ListView(
        children: <Widget>[
          new Container(
            // color: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 10.0, 0.0, 10.0),
            child: new Row(children: <Widget>[
              new Image.asset(
                'lib/app/assets/pp.png',
                width: 60,
                height: 60,
              ),
              new Container(
                  padding: EdgeInsets.fromLTRB(15, 0.0, 0.0, 0.0),
                  child: new Row(children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                            padding: EdgeInsets.fromLTRB(0, 0.0, 90.0, 0),
                            child: new Row(children: <Widget>[
                              new Text("Daniel Fayemi",
                                  style: TextStyle(
                                      height: 2,
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100))
                            ])),
                        new Container(
                            padding: EdgeInsets.fromLTRB(0, 0.0, 40.0, 0),
                            child: new Row(children: <Widget>[
                              Text("danieltosinfayemi@gmail.com",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w100))
                            ])),
                        new Container(
                            // alignment: Alignment(10.0, 10.0),
                            padding: EdgeInsets.fromLTRB(0, 5.0, 135.0, 0),
                            child: Text("Edit Profile",
                                style: TextStyle(
                                    color: Colors.deepPurple[500],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100))),
                      ],
                    )
                  ]))
            ]),
          ),
          Divider(),
          InkWell(
              onTap: () {},
              child: ListTile(

                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Messages',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.message,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.notifications,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Bookmarks',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.bookmark,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          Divider(),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Post an Errand',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.content_paste,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Manage Orders',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          Divider(),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Help',
                  style: TextStyle(fontSize: 21),
                ),
                leading: Icon(
                  Icons.help_outline,
                  size: 30.0,
                  color: Colors.black,
                ),
              )),
          InkWell(
            highlightColor: Colors.red,
            child: Container(
              color: Colors.black,
            ),
          ),

          // ListTile(

          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
        appBar: _appBar(),
        drawer: _sideBar(),
        body: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // new TopNav(),
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
