import 'dart:io';
import 'package:ikelapp/models/address.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/screens/general/addres_updtate.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    if (response.error == unauthorized){
      isloagged = false;
    }else{
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
    ApiResponse response = await login(txtEmailController.text, txtPassword.text);
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Próximamente')));
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
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
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
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
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
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

              kLoginRegisterHint('¿No tienes cuenta? Registrate ', 'aqui', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Register()),
              );
            }),
            SizedBox(height: 10.0),
             Container(
                child: Text(
                    "LLEVAMOS TUS PRODUCTOS HASTA LA PUERTA DE TU CASA, TENEMOS TODA LA COCTELERIA DE PISTOLS PITS",
                    style: TextStyle(color: SECONDARY_COLOR)))
            ],
          ),
        ),
      ),
    );
  }
}
