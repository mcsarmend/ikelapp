import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/address_register.dart';
import 'Screens/prelogin.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: address_register(),
    );
  }
}
