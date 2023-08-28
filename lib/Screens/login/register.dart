import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/screens/general/terms_Conditions.dart';
import 'package:ikelapp/screens/home.dart';
import 'package:ikelapp/screens/loading.dart';

import 'package:ikelapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      numberController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  void _registerUser() async {
    ApiResponse response = await register(nameController.text,
        emailController.text, passwordController.text, numberController.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  showAlertDialog(BuildContext context) {
    // Configurar el botón de OK
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Crear el AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alerta"),
      content: Text("No haz aceptado los términos y condiciones."),
      actions: [
        okButton,
      ],
    );

    // Mostrar el AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRYMARY_COLOR,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Registrarse'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          children: [
            TextFormField(
                controller: nameController,
                validator: (val) => val!.isEmpty ? 'Nombre inválido' : null,
                decoration: kInputDecoration('Name')),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val!.isEmpty ? 'Correo inválido' : null,
                decoration: kInputDecoration('Email')),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: numberController,
              keyboardType:
                  TextInputType.number, // Cambiamos el tipo de teclado a número
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Número inválido';
                }
                if (val.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(val)) {
                  return 'El número debe contener exactamente 10 dígitos';
                }
                return null;
              },
              decoration: kInputDecoration('Número'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (val) => val!.length < 6
                    ? 'Se requieren al menos 6 caracteres'
                    : null,
                decoration: kInputDecoration('Contraseña')),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordConfirmController,
                obscureText: true,
                validator: (val) => val != passwordController.text
                    ? 'Confirm password does not match'
                    : null,
                decoration: kInputDecoration('Confirmar contraseña')),
            SizedBox(
              height: 20,
              child: Text(""),
            ),
            Row(
              children: [
                Center(
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                ),
                Center(
                  child: Text("Acepto después de haber leído los"),
                ),
              ],
            ),
            kLoginRegisterHint(
                '', 'Términos, condiciones y politicas de privacidad', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsAndConditions()),
              );
            }),
            SizedBox(
              height: 20,
              child: Text(""),
            ),
            loading
                ? Center(child: CircularProgressIndicator())
                : kTextButton(
                    'Registrarse',
                    () {
                      if (_isChecked == true) {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            loading = !loading;
                            _registerUser();
                          });
                        }
                      } else {
                        showAlertDialog(context);
                      }
                    },
                  ),
            SizedBox(
              height: 20,
            ),
            kLoginRegisterHint('¿Ya tienes una cuenta? ', 'Accede', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Loading()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
