import 'package:errnd/app/api/auth_api.dart';
import 'package:errnd/app/api/user_api.dart';
import 'package:errnd/app/components/button.dart';
import 'package:errnd/app/components/email_field.dart';
import 'package:errnd/app/components/error_box.dart';
import 'package:errnd/app/components/password_field.dart';
import 'package:errnd/app/components/ui.dart';
import 'package:errnd/app/validators/email_validation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../store.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;
  TextEditingController _emailController, _passwordController;
  String _errorText, _emailError, _passwordError;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = Store.getToken(_sharedPreferences);
    if (authToken != null) {
      Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed('/home');
    }
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  _valid() {
    bool valid = true;

    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email can't be blank!";
    } else if (!_emailController.text.contains(EmailValidator.regex)) {
      valid = false;
      _emailError = "Enter valid email!";
    }

    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Password can't be blank!";
    } else if (_passwordController.text.length < 6) {
      valid = false;
      _passwordError = "Password is invalid!";
    }

    return valid;
  }

  _authenticateUser() async {
    _showLoading();
    if (_valid()) {
      var responseJson = await Auth.authenticateUser(
          _emailController.text, _passwordController.text);

      print(responseJson);

      if (responseJson == null) {
        UI.showSnackBar(_scaffoldKey, 'Something went wrong!');
      } else if (responseJson == 'NetworkError') {
        UI.showSnackBar(_scaffoldKey, null);
      } else if (responseJson['status'] == 401) {
        UI.showSnackBar(_scaffoldKey, 'Invalid Email/Password');
      } else if (responseJson['status'] == 404) {
        UI.showSnackBar(_scaffoldKey, 'Invalid Account');
      } else {
        Store.setDetails(_sharedPreferences, responseJson);

        var userresponseJson = await UserApi.getUser(responseJson);
        print(userresponseJson);

        if (userresponseJson == null) {
          UI.showSnackBar(_scaffoldKey, 'Something went wrong!');
        } else if (userresponseJson == 'NetworkError') {
          UI.showSnackBar(_scaffoldKey, null);
        } else if (userresponseJson['status'] == 401) {
          UI.showSnackBar(_scaffoldKey, 'Invalid Email/Password');
        } else if (userresponseJson['status'] == 404) {
          UI.showSnackBar(_scaffoldKey, 'Invalid Account');
        } else {
          Store.setUserDetails(_sharedPreferences, userresponseJson);
          Navigator.of(_scaffoldKey.currentContext)
              .pushReplacementNamed('/home');
        }
      }
      _hideLoading();
    } else {
      setState(() {
        _isLoading = false;
        _emailError;
        _passwordError;
      });
    }
  }

  Widget _loginScreen() {
    return new Container(
      child: new ListView(
        // padding: const EdgeInsets.only(top: 100.0, left: 16.0, right: 16.0),
        children: <Widget>[
          Container(
              child: Stack(children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 130.0, 0.0, 0.0),
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.deepPurple[700],
                      fontFamily: 'CircularStd')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 195.0, 0.0, 0.0),
              child: Text('Hello there!',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      fontFamily: 'CircularStd')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 230.0, 0.0, 0.0),
              child: Text('Welcome Back',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      fontFamily: 'CircularStd')),
            ),
          ])),
          new ErrorBox(isError: _isError, errorText: _errorText),
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
            child: Column(children: <Widget>[
              new EmailField(
                  emailController: _emailController, emailError: _emailError),
              new PasswordField(
                passwordController: _passwordController,
                obscureText: _obscureText,
                passwordError: _passwordError,
                togglePassword: _togglePassword,
              ),
              Container(
                alignment: Alignment(1.0, 0.0),
                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed('/forgotPassword');
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.deepPurple[500],
                      fontWeight: FontWeight.normal,
                      fontFamily: 'CircularStd',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ]),
          ),
          new CustomButton(
            onPressed: _authenticateUser,
            buttonName: 'Login',
          ),
          Container(
              padding: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontFamily: 'CircularStd'),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/register');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.deepPurple[500],
                          fontFamily: 'CircularStd',
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.overline
                        ),
                      ),
                    )
                  ],
                )
              ]))
        ],
      ),
    );
  }

  _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _loadingScreen() {
    return new Container(
        margin: const EdgeInsets.only(top: 300.0),
        child: new Center(
            child: new Column(
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 3.0,
              backgroundColor: Colors.deepPurple[500],
            ),
            // new Container(
            //   padding: const EdgeInsets.all(8.0),
            //   child: new Text(
            //     'Please Wait',
            //     style:
            //         new TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
            //   ),
            // )
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        body: _isLoading ? _loadingScreen() : _loginScreen());
  }
}
