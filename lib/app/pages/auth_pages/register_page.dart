import 'package:errnd/app/api/auth_api.dart';
import 'package:errnd/app/components/button.dart';
import 'package:errnd/app/components/email_field.dart';
import 'package:errnd/app/components/error_box.dart';
import 'package:errnd/app/components/number_field.dart';
import 'package:errnd/app/components/password_field.dart';
import 'package:errnd/app/components/string_field.dart';
import 'package:errnd/app/components/ui.dart';
import 'package:errnd/app/validators/email_validation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../store.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;
  int _radioValue = 0;
  String _roleController;
  TextEditingController _emailController, _passwordController, _nameController;
  String _errorText, _emailError, _passwordError, _phoneError, _nameError;

  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
    _roleController = 'customer';
    _nameController = new TextEditingController();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
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
    if (_nameController.text.isEmpty) {
      valid = false;
      _nameError = "name can't be blank!";
    } else if (_nameController.text.length < 1) {
      valid = false;
      _nameError = "name is invalid!";
    }

    if (_roleController.isEmpty) {
      valid = false;
      _phoneError = "phone can't be blank!";
    }

    return valid;
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (value) {
        case 0:
          _roleController = 'customer';
          break;
        case 1:
          _roleController = 'runner';
          break;
        default:
          _roleController = 'customer';
      }
    });
  }

  _registerInit() async {
    _showLoading();
    if (_valid()) {
      var responseJson = await Auth.register(_emailController.text,
          _nameController.text, _roleController, _passwordController.text);

      print(responseJson);
      if (responseJson == null) {
        UI.showSnackBar(_scaffoldKey, 'Something went wrong!');
      } else if (responseJson == 'NetworkError') {
        UI.showSnackBar(_scaffoldKey, null);
      } else if (responseJson['data']['error'] ==
          'User already exists, please sign up a new user') {
        UI.showSnackBar(
            _scaffoldKey, 'User already exists, please sign up a new user');
      } else {
        Store.setDetails(_sharedPreferences, responseJson);

        Navigator.of(_scaffoldKey.currentContext).pushReplacementNamed('/home');
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

  Widget _registerScreen() {
    return new Container(
        // padding: EdgeInsets.only(top: 20.0, left: 20.0),
        child: new ListView(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(bottom: 18.0),
          child: Stack(children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 130.0, 0.0, 0.0),
              child: Text('Sign up',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w100,
                      color: Colors.deepPurple[700],
                      fontFamily: 'CircularStd')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30.0, 165.0, 0.0, 0.0),
              child: Text('welcome to errnd',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontFamily: 'CircularStd')),
            ),
          ])),
      new ErrorBox(isError: _isError, errorText: _errorText),
      Container(
        margin: const EdgeInsets.only(bottom: 18.0),
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: Column(children: <Widget>[
          new StringField(
            stringController: _nameController,
            stringError: _nameError,
            labelName: 'Username',
          ),
          new EmailField(
              emailController: _emailController, emailError: _emailError),
          new PasswordField(
            passwordController: _passwordController,
            obscureText: _obscureText,
            passwordError: _passwordError,
            togglePassword: _togglePassword,
          ),
          new Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Customer',
                  style: TextStyle(
                    color: Colors.deepPurple[700],
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Radio(
                  activeColor: Colors.deepPurple[700],
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Runner',
                  style: TextStyle(
                    color: Colors.deepPurple[700],
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Radio(
                  activeColor: Colors.deepPurple[700],
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
              ])
        ]),
      ),
      new CustomButton(
        onPressed: _registerInit,
        buttonName: 'Sign up',
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontFamily: 'CircularStd'),
          ),
          SizedBox(width: 5.0),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.deepPurple[700],
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline
              ),
            ),
          )
        ],
      )
    ]));
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
        body: _isLoading ? _loadingScreen() : _registerScreen());
  }
}
