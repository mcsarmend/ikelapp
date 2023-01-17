import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/register_screen.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:flutterapp/rounded_button.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  final Color PRYMARY_COLOR = Color.fromRGBO(143, 164, 58, 1);
  final Color SECONDARY_COLOR = Color.fromRGBO(141, 166, 199, 1);
  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log(response.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Llena todos los campos');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  _email = value;
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white38,
                  prefixIcon:
                      Icon(Icons.email, color: Color.fromRGBO(143, 164, 58, 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(143, 164, 58, 1), width: 1)),
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white38,
                  prefixIcon: Icon(Icons.vpn_key_sharp,
                      color: Color.fromRGBO(143, 164, 58, 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(143, 164, 58, 1), width: 1)),
                  hintText: 'Contraseña',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                btnText: 'Acceder',
                /* onBtnPressed: () => loginPressed(), */
                onBtnPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ));
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RegisterScreen(),
                        ));
                  },
                  child: Text("Registrarse"))
            ],
          ),
        ));
  }
}
