import 'package:errnd/app/api/auth_api.dart';
import 'package:errnd/app/components/button.dart';
import 'package:errnd/app/components/post_body.dart';
import 'package:errnd/app/components/search_bar.dart';
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
  var names = new List<String>();
  SharedPreferences _sharedPreferences;
  var _authToken, _welcomeMes;

  _list() {
    names.add("Joe");
    names.add("Frankie");
    names.add("Tom");
    names.add("Larry");
    names.add("Larry");
    names.add("Larry");
    names.add("Larry");
    names.add("Larry");
    names.add("Larry");

    for (var n in names) {
      print('Hello $n');
    }
  }

  @override
  void initState() {
    super.initState();
    _list();
    _fetchSessionAndNavigate();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    var authToken = _sharedPreferences.getString(Store.authTokenKey);
    var welcomeMes = _sharedPreferences.getString(Store.loginMessage);

    UI.showSnackBarSuccess(_scaffoldKey, welcomeMes);

    setState(() {
      _authToken = authToken;
      _welcomeMes = welcomeMes;
    });

    if (_authToken == null) {
      _logout();
    }
  }

  _logout() {
    Auth.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
  }

  Widget _appBar() {
    return new AppBar(
      title: new Image.asset(
        'lib/app/assets/logo.png',
        width: 90,
        height: 60,
      ),
      iconTheme: IconThemeData(color: Colors.deepPurple[500], size: 100.0),
      actionsIconTheme: IconThemeData(size: 90),
      centerTitle: true,
      elevation: 0,
      brightness: Brightness.light,
      bottomOpacity: 0,
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _sideBar() {
    return new Drawer(
        elevation: 16,
        child: new Stack(
          children: <Widget>[
            new Column(
              // child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  // color: Colors.white,
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: new Row(children: <Widget>[
                    new Column(children: <Widget>[
                      new Image.asset(
                        'lib/app/assets/pp.png',
                        width: 60,
                        height: 60,
                      ),
                    ]),
                    new Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(left: 6),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                  margin: EdgeInsets.only(right: 50),

                                  // padding: EdgeInsets.fromLTRB(0, 0.0, 90.0, 0),
                                  child: new Row(children: <Widget>[
                                    new Text("Daniel Fayemi",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            height: 2,
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w100)),
                                  ])),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Container(
                                  // margin: EdgeInsets.only(top: 5),
                                  child: new Row(children: <Widget>[
                                Text("danieltosinfayemi@gmail.com",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w100))
                              ])),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        // alignment: Alignment(10.0, 10.0),
                        margin: EdgeInsets.only(top: 10, right: 60),
                        child: Text("Edit Profile",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.deepPurple[500],
                                fontSize: 15,
                                fontWeight: FontWeight.w100))),
                  ],
                ),
                Divider(
                  height: 30,
                ),
                new Container(
                    child: new Column(children: <Widget>[
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.home,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Home',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ])),
                  ),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.chat,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Messages',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: new Material(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.red[400],
                                child: new Container(
                                  margin: EdgeInsets.all(4),
                                  child: new Text('12',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 11.0,
                                        color: Colors.white,
                                      )),
                                )),
                          )
                        ])),
                  ),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.notifications,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Notifications',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              child: new Material(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  color: Colors.red[400],
                                  child: new Container(
                                    margin: EdgeInsets.all(4),
                                    child: new Text('22',
                                        style: new TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11.0,
                                          color: Colors.white,
                                        )),
                                  )))
                        ])),
                  ),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.bookmark,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Bookmarks',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ])),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.content_paste,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Post an Errand',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ])),
                  ),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.list,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Manage Order',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ])),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.settings,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Settings',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ])),
                  ),
                  InkWell(
                    onTap: () {},
                    // splashColor: Colors.deepPurple[500],
                    // highlightColor: Colors.deepPurple[500],
                    child: new Container(
                        padding: EdgeInsets.fromLTRB(20, 8.0, 0.0, 10.0),
                        child: new Row(children: <Widget>[
                          Container(
                            child: new Icon(
                              Icons.help,
                              size: 25,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: new Text(
                              'Help',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ])),
                  ),
                ])),
              ],
            ),
            new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      decoration: new BoxDecoration(
                        // color: Colors.purple,
                        gradient: new LinearGradient(
                            colors: [
                              const Color.fromRGBO(135, 205, 207, 1),
                              const Color.fromRGBO(111, 75, 225, 1),
                            ],
                            begin: Alignment.centerRight,
                            end: new Alignment(-1.0, -1.0)),
                      ),
                      margin: EdgeInsets.only(top: 120),
                      alignment: Alignment.center,

                      // padding: EdgeInsets.only(bottom: 10),
                      child: InkWell(
                          splashColor: Colors.deepPurple[500],
                          highlightColor: Colors.deepPurple[500],
                          // splashColor: Colors.blue,
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              'Switch to Runner Mode',
                              style:
                                  TextStyle(fontSize: 21, color: Colors.white),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ))),
                ])
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[100]
        // const Color.fromRGBO(255, 250, 250, 1)
        ,
        key: _scaffoldKey,
        appBar: _appBar(),
        drawer: _sideBar(),
        body: new Container(
          padding: EdgeInsets.only(top: 10),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.only(top: 2, left: 20),
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Text(
                                    'Hi Daniel!',
                                    style: TextStyle(
                                        color: Colors.deepPurple[700],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: new Text(
                                        'What would you like to do',
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 15,
                                            fontWeight: FontWeight.w200),
                                      ))
                                ],
                              ),
                            ],
                          )),
                      new Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: new SearchBar()),
                      new Expanded(
                        // padding: EdgeInsets.only(top: 100),
                        child: Builder(
                          builder: (BuildContext context) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: names.length,
                              itemBuilder: (BuildContext context, int index) {
                                // return new Text(names[index]);
                                return new PostBody(name: names[index]);
                              },
                            );
                          },
                        ),
                      ),
                      // new PostBody(),
                    ])
              ]),
        ));
  }
}
