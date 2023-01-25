import 'package:blogapp/screens/home.dart';
import '../constant.dart';
import 'package:flutter/material.dart';

class address_register extends StatefulWidget {
  @override
  State<address_register> createState() => _address_registerState();
}

class _address_registerState extends State<address_register> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? state = '9';
  String? city = '266';
  String? suburb = '204308';
  String? suburb2 = '9';
  String? codigo = '204308';
  String address = '';
  String street = '';
  String number = '';
  String clientEmail = "";
  String t = "texto";
  bool loading = false;
  var estados = [];
  var municipios = [];
  var cps = [];
  @override
  void initState() {
    super.initState();
    suburb = '204308';
    codigo = '204308';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRYMARY_COLOR,
        title: Text("Actualizar ubicacióm"),
        iconTheme: IconThemeData(
          color: Colors.white, // <-- SEE HERE
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Home()),
                    (route) => false);
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
              icon: const Icon(Icons.expand_more_sharp),
              value: state,
              dropdownColor: Colors.white,
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              hint: const Text('Seleccionar Estado'),
              items: estados.map(
                (states) {
                  return DropdownMenuItem(
                    child: Text(states['estado'].toString()),
                    value: states['idestado'].toString(),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                setState(
                  () {
                    state = value!;
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            /* 
            DropdownButton(
              icon: const Icon(Icons.expand_more_sharp),
              value: city,
              dropdownColor: Colors.white,
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              hint: const Text('Seleccionar Municipio'),
              items: municipios.map(
                (cities) {
                  return DropdownMenuItem(
                    child: Text(cities['municipio'].toString()),
                    value: cities['idmunicipio'].toString(),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                setState(
                  () {
                    city = value!;
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
              icon: const Icon(Icons.expand_more_sharp),
              value: suburb,
              dropdownColor: Colors.white,
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              hint: const Text('Seleccionar colonia'),
              items: cps.map(
                (cities) {
                  return DropdownMenuItem(
                    child: Text(cities['colonia'].toString()),
                    value: cities['idcp'].toString(),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                setState(
                  () {
                    suburb = value!;
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
              icon: const Icon(Icons.expand_more_sharp),
              value: codigo,
              dropdownColor: Colors.white,
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              hint: const Text('Seleccionar codigo postal'),
              items: cps.map(
                (cps) {
                  return DropdownMenuItem(
                    child: Text(cps['cp'].toString()),
                    value: cps['idcp'].toString(),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                setState(
                  () {
                    codigo = value!;
                  },
                );
              },
            ), */
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Calle',
              ),
              onChanged: (value) {
                street = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Número',
              ),
              onChanged: (value) {
                number = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : kTextButton('Actualizar ubicación', () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                    }
                  }),
            SizedBox(
              height: 10,
            ),
          ])),
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
