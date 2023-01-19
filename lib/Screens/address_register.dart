import 'package:flutter/material.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:flutterapp/Services/locations.dart';

import '../rounded_button.dart';

String? state = '9';
String? city = '139979';
String? suburb = '2000';
String? cp = '2000';
String address = '';

class address_register extends StatefulWidget {
  @override
  State<address_register> createState() => _address_registerState();
}

class _address_registerState extends State<address_register> {
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
              hint: const Text('Seleccionar Colonia'),
              items: cps.map(
                (suburb) {
                  return DropdownMenuItem(
                    child: Text(suburb['colonia'].toString()),
                    value: suburb['cp'].toString(),
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
              value: cp,
              dropdownColor: Colors.white,
              iconSize: 36,
              isExpanded: true,
              underline: const SizedBox(),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
              hint: const Text('Seleccionar código postal'),
              items: cps.map(
                (cps) {
                  return DropdownMenuItem(
                    child: Text(cps['cp'].toString()),
                    value: cps['cp'].toString(),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                setState(
                  () {
                    cp = value!;
                  },
                );
              },
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => address_register(),
                        ));
                  },
                )),
          ])),
    );
  }
}
