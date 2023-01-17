import 'package:flutter/material.dart';
import 'package:flutterapp/rounded_button.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Center(
        child: RoundedButton(
          onBtnPressed: () => Navigator.pushNamed(context, 'page2'),
          btnText: ("Go to Page 2 "),
        ),
      ),
    );
  }
}
