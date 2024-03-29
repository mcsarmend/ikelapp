import 'dart:convert';
import 'dart:io';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/models/address.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// login
Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError + " " + e.toString();
  }

  return apiResponse;
}

Future<ApiResponse> drop(String userId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(dropURL),
        headers: {'Accept': 'application/json'}, body: {'id': userId});

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError + " " + e.toString();
  }

  return apiResponse;
}

// Register
Future<ApiResponse> register(
    String name, String email, String password, String number) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'email': email,
      'pass': password,
      'password': password,
      'password_confirmation': password,
      'type': '1',
      'number': number
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// User
Future<ApiResponse> getUserDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(userURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError + e.toString();
  }
  return apiResponse;
}

Future<ApiResponse> getaddress(String userId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(addressURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'userId': userId,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = Address.fromJson(jsonDecode(response.body));
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)["error"];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> getDeliverys(String userId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(deliverysURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'user_id': userId,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)["error"];
        break;
      default:
        var error =  somethingWentWrong + " " + jsonDecode(response.body)["error"];
        apiResponse.error = error;
        break;
    }
  } catch (e) {
    var error = serverError + e.toString();
    apiResponse.error =error ;
  }
  return apiResponse;
}

Future<ApiResponse> startProgress(
    String userId, String status, String orderstatus) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(startProgressURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'status': status,
      'user_id': userId,
      'orderstatus': orderstatus
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)["error"];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> endProgress(
    String userId, String status, String order_id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(endProgressURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'status': status,
      'user_id': userId,
      'order_id': order_id
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)["error"];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}


Future<ApiResponse> getorders(String userId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(ordersURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'user_id': userId,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)["error"];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> setorders({
  String? internal_id,
  String? client_name,
  String? client_number,
  String? order_description,
  String? cost,
  double? lat_destiny,
  double? lon_destiny,
}) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    final response = await http.post(Uri.parse(setOrder), headers: {
      'Accept': 'application/json'
    }, body: {
      'internal_id': internal_id,
      "client_name": client_name,
      "client_number": client_number,
      "order_description": order_description,
      "cost": cost,
      "lat_destiny": lat_destiny.toString(),
      "lon_destiny": lon_destiny.toString()
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = "Orden guardada correctamente";
        break;
      case 422:
        apiResponse.error = jsonDecode(response.body)["error"];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> updateaddressbycp(String userId, String state, String city,
    String suburb, String street, String number, String cp) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(setaddressByCpURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'userId': userId,
      'city': city,
      'state': state,
      'cp': cp,
      'street': street,
      'number': number,
      'suburb': suburb
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> getaddressbycp(String cp) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(addressByCpURL), headers: {
      'Accept': 'application/json'
    }, body: {
      'cp': cp,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = Address.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// Update user
Future<ApiResponse> updateUser(
  String name,
  String? image,
  String? email,
  String? number,
) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(Uri.parse(userURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: image == null
            ? {
                'name': name,
                "email": email,
                "number": number,
              }
            : {
                'name': name,
                'image': image,
                "email": email,
                "number": number,
              });
    // user can update his/her name or name and image

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// get token
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

// get user id
Future<int> getUserId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('userId') ?? 0;
}

// logout
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

// Get base64 encoded image
String? getStringImage(File? file) {
  if (file == null) return null;
  return base64Encode(file.readAsBytesSync());
}
