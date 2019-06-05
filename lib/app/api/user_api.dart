import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config.dart' as config;
import '../path.dart' as path;
import '../store.dart';

class UserApi {
  static final String host = config.host;
  static final String productionHost = config.productionHost;
  static final String developmentHost = config.developmentHost;

  static dynamic getUser(String email, String password) async {
    var uri = host + path.login;
  }
}
