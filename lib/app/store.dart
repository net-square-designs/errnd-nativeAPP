import 'package:errnd/app/utils/decode_bit64.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store {
  //initialize store variable
  static final String authTokenKey = 'auth_token';
  static final String userIdKey = 'user_id';
  static final String nameKey = 'name';
  static final String roleKey = 'role';
  static final String loginMessage = 'message';

  //user details
  static final String userUsername = 'user_username';
  static final String userEmail = 'user_email';
  static final String userRole = 'user_role';
  static final String userId = 'user_id';

  static final String firstname = 'firstname';

  //store getters
  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  //store setters

  static setToken(SharedPreferences prefs, var response) {
    var token = response['data']['token'];

    prefs.setString(authTokenKey, token);
  }

  static setDetails(SharedPreferences prefs, var response) {
    var token = response['data']['token'];
    prefs.setString(authTokenKey, token);
    var message = response['data']['message'];
    prefs.setString(loginMessage, message);
    final dd = Decode().parseJwt(token);
    prefs.setString(userUsername, dd['username']);
  }

  static setUserDetails(SharedPreferences prefs, var response) {
    final userDetail = response['data']['user'];
    prefs.setString(userEmail, userDetail['email']);
    // prefs.setString(userUsername, userDetail['username']);
    prefs.setString(userRole, userDetail['role']);
    prefs.setInt(userId, userDetail['userId']);
    prefs.setString(firstname, userDetail['firstname']);
    print(firstname);
  }
}
