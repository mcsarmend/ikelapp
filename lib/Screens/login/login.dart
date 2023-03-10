import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/screens/login/prelogin.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';
import '../delivery/delivery_user_screen.dart';
import '../home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      var n = response.data as User;
      if (n.type == "1") {
        _saveAndRedirectToHome(n);
      } else {
        _saveAndRedirectToHomeR(n);
      }
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  void _saveAndRedirectToHomeR(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => delivery_user_screen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRYMARY_COLOR,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => prelogin_screen()),
            );
          },
        ),
        centerTitle: true,
        title: Text('Acceder'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: txtEmail,
                validator: (val) => val!.isEmpty ? 'Correo inv??lido' : null,
                decoration: kInputDecoration('Email')),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: txtPassword,
                obscureText: true,
                validator: (val) => val!.length < 6
                    ? 'Se requieren al menos 6 caracteres'
                    : null,
                decoration: kInputDecoration('Password')),
            SizedBox(
              height: 10,
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : kTextButton('Acceder', () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        _loginUser();
                      });
                    }
                  }),
            SizedBox(
              height: 10,
            ),
            kLoginRegisterHint('??No tienes cuenta? ', 'Registrarse', () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                  (route) => false);
            })
          ],
        ),
      ),
    );
  }
}
