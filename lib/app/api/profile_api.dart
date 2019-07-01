import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart' as config;
import '../path.dart' as path;
import '../store.dart';

class Profile {
  static final String host = config.host;
  static final String productionHost = config.productionHost;
  static final String developmentHost = config.developmentHost;

  static dynamic viewOwnProfile() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences _sharedPreferences;
    _sharedPreferences = await _prefs;

    var username = _sharedPreferences.getString(Store.userUsername);

    var uri = host + path.profile + username;

    try {
      final response =
          await http.get(uri, headers: {'Authorization': Store.authTokenKey});

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic updateOwnProfile(String firstName, String lastName,
      String image, String location, String bio, String phone) async {
    var uri = host + path.profile + Store.userUsername;

    try {
      final response = await http.post(uri, body: {
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
        "bio": bio,
        "phone": phone
      }, headers: {
        'Authorization': Store.authTokenKey
      });

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }
}
