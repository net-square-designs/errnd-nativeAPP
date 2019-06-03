import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config.dart' as config;
import '../path.dart' as path;
import '../store.dart';

class Auth {
  static final String host = config.host;
  static final String productionHost = config.productionHost;
  static final String developmentHost = config.developmentHost;

  static dynamic authenticateUser(String email, String password) async {
    var uri = host + path.login;

    try {
      final response =
          await http.post(uri, body: {'email': email, 'password': password});

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

  static logoutUser(BuildContext context, SharedPreferences prefs) {
    prefs.setString(Store.authTokenKey, null);
    // prefs.setInt(Store.userIdKey, null);
    // prefs.setString(Store.nameKey, null);
    Navigator.of(context).pushReplacementNamed('/login');
  }

  static dynamic register(
      String email, String username, String role, String password) async {
    var uri = host + path.register;

    try {
      final response = await http.post(uri, body: {
        'email': email,
        'password': password,
        'username': username,
        'role': role
      });

      final responseJson = json.decode(response.body);
      // authenticateUser(email, password);
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

  static dynamic forgotpassword(String email) async {
    var uri = host + path.forgotpassword;

    try {
      final response = await http.post(uri, body: {
        'email': email,
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
