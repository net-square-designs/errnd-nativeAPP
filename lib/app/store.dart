import 'package:shared_preferences/shared_preferences.dart';

class Store {
  //initialize store variable
  static final String authTokenKey = 'auth_token';
  static final String userIdKey = 'user_id';
  static final String nameKey = 'name';
  static final String roleKey = 'role';
  static final String loginMessage = 'message';

  //store getters
  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  //store setters

  static setToken(SharedPreferences prefs, var response) {
    var token = response['data']['token'];
    print(authTokenKey);
    print(token);
    prefs.setString(authTokenKey, token);
  }

  static setDetails(SharedPreferences prefs, var response) {
    var token = response['data']['token'];
    prefs.setString(authTokenKey, token);
    var message = response['data']['message'];
    prefs.setString(loginMessage, message);
    // prefs.setString(nameKey, user['name']);
  }
}
