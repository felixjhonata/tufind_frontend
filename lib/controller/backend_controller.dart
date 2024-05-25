import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class BackendController {
  static const String host = "http://10.0.2.2:8080/";
  static Future<Response> post(String path,
      {Map<dynamic, dynamic>? body, Map<String, String>? headers}) async {
    return http.post(Uri.parse(host + path),
        body: jsonEncode(body), headers: headers);
  }
}
