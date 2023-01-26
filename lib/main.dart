import 'package:blogapp/screens/healthy_fun_screeen.dart';
import 'package:blogapp/screens/prelogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: prelogin_screen(),
    );
  }
}
