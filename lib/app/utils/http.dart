import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart' as config;

class Http {
  static final String host = config.host;
  static final String productionHost = config.productionHost;
  static final String developmentHost = config.developmentHost;

  static fetch(var authToken, var endPoint) async {
    var uri = host + endPoint;

    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
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

  // static post(var authToken, var endPoint, dynamic body) async {
  //   var uri = host + endPoint;

  //   try {} catch (exception) {
  //     print(exception);
  //     if (exception.toString().contains('SocketException')) {
  //       return 'NetworkError';
  //     } else {
  //       return null;
  //     }
  //   }
  // }
}
