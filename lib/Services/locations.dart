import 'dart:convert';
import 'package:flutterapp/Services/globals.dart';
import 'package:http/http.dart' as http;

class locations {
  static Future<http.Response> getAddrees(String email) async {
    Map data = {"email": email};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'getaddress');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> setAddress(
      email, state, city, suburb, cp) async {
    Map data = {
      "email": email,
      "state": state,
      "city": city,
      "suburb": suburb,
      "cp": cp
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'insertupdateaddress');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> getstatelocation() async {
    Map data = {};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'estados');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> getcitylocation(String? idstate) async {
    Map data = {"idestado": idstate};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'municipios');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }

  static Future<http.Response> getcpslocation(String? idstate) async {
    Map data = {"idmunicipio": idstate};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'cps');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    return response;
  }
}
