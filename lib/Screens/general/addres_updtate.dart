import 'package:ikelapp/screens/home.dart';
import '../../constant.dart';
import 'package:flutter/material.dart';
import '../../models/address.dart';
import '../../models/api_response.dart';
import '../../models/user.dart';
import '../../services/user_service.dart';

class address_register extends StatefulWidget {
  @override
  State<address_register> createState() => _address_registerState();
}

class _address_registerState extends State<address_register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int userId = 0;
  String clientEmail = "";
  String t = "texto";
  bool loading = false;
  User? user;
  String location = "Sin ubicación";
  var estados = [];
  var municipios = [];
  var cps = [];
  var cpVal = "";

  TextEditingController txtSuburbController = TextEditingController();
  TextEditingController txtCityController = TextEditingController();
  TextEditingController txtStateController = TextEditingController();
  TextEditingController txtStreetController = TextEditingController();
  TextEditingController txtNumberController = TextEditingController();
  String stateId = "";
  String cityId = "";
  String suburb = "";

  void getUser() async {
    ApiResponse response = await getUserDetail();
    userId = await getUserId();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
      });
    }
  }

  void get_addres_by_cp(cp) async {
    ApiResponse response = await getaddressbycp(cp.toString());
    if (response.error == null) {
      setState(() {
        loading = false;
        var address = response.data as Address;
        txtStateController.text = address.state.toString();
        txtCityController.text = address.city.toString();
        txtSuburbController.text = address.suburb.toString();
        stateId = address.idState.toString();
        cityId = address.idCity.toString();
        suburb = address.suburb.toString();
      });
    }
  }

  void update_address(cp) async {
    txtStreetController.text = street;
    txtNumberController.text = number;
    ApiResponse response = await updateaddressbycp(userId.toString(), stateId,
        cityId, suburb, street, number, cp.toString());
    var r = response.data.toString();
    t = r;
    showAlertDialog(context);
    if (response.error == null) {
      loading = false;
    }
  }

  String street = "";

  String number = "";
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acualizar ubicación'),
        backgroundColor: PRYMARY_COLOR,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            height: 40,
            child: kTextButton('Buscar por código', () {
              get_addres_by_cp(cpVal);
              setState(() {
                loading = true;
              });
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              key: formKey,
              child: Column(children: [
                TextFormField(
                  decoration: kInputDecoration('Código Postal'),
                  validator: (val) => val!.isEmpty ? 'Código inávildo' : null,
                  onChanged: (val) => {
                    setState(() {
                      cpVal = val;
                      loading = false;
                    })
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kInputDecoration('Estado'),
                  controller: txtStateController,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kInputDecoration('Municipio'),
                  controller: txtCityController,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kInputDecoration('Colonia'),
                  controller: txtSuburbController,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kInputDecoration('Calle'),
                  controller: txtStreetController,
                  validator: (val) => val!.isEmpty ? 'Calle no válida' : null,
                  onChanged: (val) => {street = val},
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kInputDecoration('Numero'),
                  controller: txtNumberController,
                  validator: (val) => val!.isEmpty ? 'Número no válido' : null,
                  onChanged: (val) => {number = val},
                ),
                const SizedBox(
                  height: 20,
                ),
                loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        width: 200,
                        height: 40,
                        child: kTextButton('Actualizar ubicación', () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                              update_address(cpVal);
                            });
                          }
                        }),
                      ),
                SizedBox(
                  height: 10,
                ),
              ]))
        ]),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(t),
      content: Text("Tu ubicación ha sido actualizada."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
