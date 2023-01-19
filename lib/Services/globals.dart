import 'package:flutter/material.dart';

const String baseURL = "http://127.0.0.1:8000/api/"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};
final Color PRYMARY_COLOR = Color.fromRGBO(143, 164, 58, 1);
final Color SECONDARY_COLOR = Color.fromRGBO(141, 166, 199, 1);
errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
