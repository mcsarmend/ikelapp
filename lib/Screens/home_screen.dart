import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/prelogin.dart';

import '../rounded_button.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color PRYMARY_COLOR = Color.fromRGBO(143, 164, 58, 1);
    final Color SECONDARY_COLOR = Color.fromRGBO(141, 166, 199, 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRYMARY_COLOR,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            SizedBox(
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: PRYMARY_COLOR, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {
                      logOutPressed(context);
                    },
                    icon: Icon(Icons.logout)),
              ),
            )
          ])),
    );
  }

  logOutPressed(context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => prelogin_screen(),
      ),
    );
  }
}
