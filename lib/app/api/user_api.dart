import 'dart:convert';
import 'package:errnd/app/utils/decode_bit64.dart';
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

  static dynamic getUser(var response) async {
    var decodedToken = Decode().parseJwt(response['data']['token']);
    var username = decodedToken['username'];
    var uri = host + path.profile + username;
    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': Store.authTokenKey},
      );
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
