import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:ikelapp/models/address.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/screens/general/addres_updtate.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant.dart';
import '../delivery/delivery_user_screen.dart';
import '../home.dart';
import '../login/login.dart';
import '../login/register.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  User? email;
  bool loading = true;
  bool isloagged = false;
  int userId = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? _imageFile;
  final _picker = ImagePicker();
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtNumberController = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String location = "Sin ubicación";

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // get user detail
  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == unauthorized) {
      isloagged = false;
    } else {
      userId = await getUserId();
      ApiResponse res = await getaddress(userId.toString());

      if (response.error == null) {
        setState(() {
          isloagged = true;
          user = response.data as User;
          loading = false;
          txtNameController.text = user!.name ?? '';
          txtEmailController.text = user!.email ?? '';
          txtNumberController.text = user!.number ?? '';

          if (res.error != null) {
            location = "Sin dirección registrada";
          } else {
            var address = res.data as Address;
            location = address.street.toString() +
                ", " +
                address.number.toString() +
                ", " +
                address.suburb.toString() +
                ", " +
                address.city.toString() +
                ", " +
                address.state.toString() +
                ", " +
                address.cp.toString();
          }
        });
      } else if (response.error == unauthorized) {
        logout().then((value) => {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false)
            });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }
  }

  //update profile
  void updateProfile() async {
    ApiResponse response = await updateUser(
        txtNameController.text,
        getStringImage(_imageFile),
        txtEmailController.text,
        txtNumberController.text);
    setState(() {
      loading = false;
    });
    setState(() {
      loading = false;
    });
    if (response.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _loginUser() async {
    ApiResponse response =
        await login(txtEmailController.text, txtPassword.text);
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

  void deleteUser() async {
    userId = await getUserId();
    ApiResponse response = await drop(userId.toString());
  }

  Future<void> _showAlert(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Si el usuario hace clic fuera del dialogo, no lo cierra
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro que quieres borrar tu cuenta?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el dialogo
              },
            ),
            TextButton(
              child: Text('Continuar'),
              onPressed: () {
                // Aquí se pone la acción que se quiere realizar si el usuario confirma
                deleteUser();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Cuenta eliminada correctamente')));
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Home()),
                    (route) => false); // Cerrar el dialogo
              },
            ),
          ],
        );
      },
    );
  }

  // Función para abrir la aplicación de correo electrónico predeterminada
  void _launchEmail(String email) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'No se pudo abrir la aplicación de correo electrónico.';
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloagged
        ? Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: PRYMARY_COLOR,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: kInputDecoration('Nombre'),
                          controller: txtNameController,
                          validator: (val) =>
                              val!.isEmpty ? 'Invalid Name' : null,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: kInputDecoration('Correo'),
                          controller: txtEmailController,
                          validator: (val) =>
                              val!.isEmpty ? 'Invalid Name' : null,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: kInputDecoration('Teléfono'),
                          controller: txtNumberController,
                          validator: (val) =>
                              val!.isEmpty ? 'Invalid Name' : null,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: PRYMARY_COLOR,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                kTextButton('Actualizar Perfil', () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    updateProfile();
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                kTextButton('Actualizar Ubicación', () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => address_register()),
                    );
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                kTextButton('Borrar cuenta', () async {
                  _showAlert(context);
                }),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    children: [
                      Text("Cerra sesión"),
                      IconButton(
                        tooltip: "Cerrar Sesión",
                        icon: Icon(Icons.exit_to_app_outlined),
                        onPressed: () {
                          logout().then((value) => {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => false)
                              });
                        },
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                        height:
                            10), // Espacio en blanco arriba del widget de texto
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Correo electrónico: ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'desarrollo_it@begroup.com.mx',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchEmail('desarrollo_it@begroup.com.mx');
                              },
                          ),
                          TextSpan(text: "\n\n"),
                          TextSpan(
                            text:
                                'Si ocurre algún problema, comunicarse al correo electrónico de arriba',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(text: "\n\n"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Logo
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: Image.asset('assets/imgs/ikellogo.png'),
                    ),
                    // Espacio entre logo y formulario
                    SizedBox(height: 15.0),
                    // Formulario de inicio de sesión
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      controller: txtEmailController,
                      decoration: InputDecoration(
                        hintText: 'Correo electrónico',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      obscureText: true,
                      controller: txtPassword,
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    // Botón de inicio de sesión
                    ElevatedButton(
                      onPressed: () {
                        _loginUser();
                      },
                      child: Text('Iniciar sesión'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PRYMARY_COLOR,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    // Espacio entre botón de inicio de sesión y registro
                    SizedBox(height: 16.0),

                    kLoginRegisterHint('¿No tienes cuenta? Registrate ', 'aqui',
                        () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    }),
                    SizedBox(height: 10.0),
                    Container(
                        child: Text(
                            "LLEVAMOS TUS PRODUCTOS HASTA LA PUERTA DE TU CASA, TENEMOS TODA LA COCTELERIA DE PISTOLS PITS",
                            style: TextStyle(color: SECONDARY_COLOR))),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        SizedBox(
                            height:
                                10), // Espacio en blanco arriba del widget de texto
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Correo electrónico: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'desarrollo_it@begroup.com.mx',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchEmail(
                                        'desarrollo_it@begroup.com.mx');
                                  },
                              ),
                              TextSpan(text: "\n\n"),
                              TextSpan(
                                text:
                                    'Si ocurre algún problema, comunicarse al correo electrónico de arriba',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(text: "\n\n"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
