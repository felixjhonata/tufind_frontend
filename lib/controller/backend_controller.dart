import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:tufind_frontend/model/user.dart';

class BackendController {
  static const String host = "http://10.0.2.2:8080/";
  // static const String host = "http://10.34.146.216:8080/";

  static Map<String, String> getHeader() {
    return {
      "Authorization": "Bearer ${User.authToken}",
    };
  }

  static Future<Response> post(String path,
      {Map<dynamic, dynamic>? body, Map<String, String>? headers}) async {
    return http.post(Uri.parse(host + path),
        body: jsonEncode(body), headers: headers);
  }

  static Future<Response> get(String path,
      {Map<String, String>? headers}) async {
    return http.get(Uri.parse(host + path), headers: headers);
  }

  static Future<Response> put(String path,
      {Map<dynamic, dynamic>? body, Map<String, String>? headers}) async {
    return http.put(Uri.parse(host + path),
        headers: headers, body: jsonEncode(body));
  }
}
