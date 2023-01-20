import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:flutterapp/Services/locations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../rounded_button.dart';

String? state = '9';
String? city = '266';
String? suburb = '204308';
String? suburb2 = '9';
String? cp = '02000';
String address = '';

class address_register extends StatefulWidget {
  @override
  State<address_register> createState() => _address_registerState();
}

class _address_registerState extends State<address_register> {
  @override
  void initState() {
    super.initState();
    suburb = '204308';
    getstatelocation();
    getcitylocation();
    getcpslocation();
    loadClientName();
  }

  String nameClient = "";
  String clientEmail = "";
  var estados = [];
  var municipios = [];
  var cps = [];
  Future<void> loadClientName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameClient = prefs.getString('name').toString();
    clientEmail = prefs.getString('email').toString();
    setState(() {});
  }

  getstatelocation() async {
    http.Response response = await locations.getstatelocation();
    if (response.statusCode == 200) {
      setState(() {
        var data = response.body;
        estados = jsonDecode(data);
      });
    }
  }

  getcitylocation() async {
    http.Response response = await locations.getcitylocation(state);
    if (response.statusCode == 200) {
      setState(() {
        var data = response.body;
        municipios = jsonDecode(data);
      });
    }
  }

  getcpslocation() async {
    http.Response response = await locations.getcpslocation(city);
    if (response.statusCode == 200) {
      setState(() {
        var data = response.body;
        cps = jsonDecode(data);
        print(cps.toString());
      });
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
                    newCity();
                    state = value!;
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
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
              hint: const Text('Seleccionar codigo postal'),
              items: cps.map(
                (cities) {
                  return DropdownMenuItem(
                    child: Text(cities['cp'].toString()),
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
            TextField(
              decoration: const InputDecoration(
                hintText: 'Calle y Número',
              ),
              onChanged: (value) {
                address = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                color: PRYMARY_COLOR,
                child: RoundedButton(
                  btnText: "Registrar Ubicacion",
                  onBtnPressed: () {
                    locations.setAddress(clientEmail, state, city, suburb, cp);
                  },
                )),
          ])),
    );
  }

  void newCity() {}
}
