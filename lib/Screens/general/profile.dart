import 'dart:io';
import 'package:ikelapp/models/address.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/screens/general/addres_updtate.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant.dart';
import '../login/login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  User? email;
  bool loading = true;
  int userId = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? _imageFile;
  final _picker = ImagePicker();
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtNumberController = TextEditingController();
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
    userId = await getUserId();
    ApiResponse res = await getaddress(userId.toString());

    if (response.error == null) {
      setState(() {
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

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40),
            child: ListView(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
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
                kTextButton('Actualizar perfil', () {
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
                kTextButton('Actualizar ubicación', () async {
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
                IconButton(
                  tooltip: "Cerrar Sesión",
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    logout().then((value) => {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Login()),
                              (route) => false)
                        });
                  },
                )
              ],
            ),
          );
  }
}
