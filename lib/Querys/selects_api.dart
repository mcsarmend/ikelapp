import 'package:blogapp/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Selects {
  static Future<http.Response> estados() async {
    Map data = {};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'estados');
    http.Response response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: body,
    );

    return response;
  }
}
