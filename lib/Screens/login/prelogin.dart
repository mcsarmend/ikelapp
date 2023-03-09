import 'package:flutter/material.dart';
import 'package:ikelapp/screens/loading.dart';
import 'package:ikelapp/screens/login/register.dart';
import 'package:ikelapp/constant.dart';

class prelogin_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Image.asset('assets/imgs/ikellogo.png'),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: TextButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loading()),
                  );
                },
                style: TextButton.styleFrom(
                    shadowColor: SECONDARY_COLOR,
                    elevation: 2,
                    backgroundColor: Colors.white),
                child: Text("Accede"),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: TextButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                style: TextButton.styleFrom(
                    shadowColor: Colors.white,
                    elevation: 2,
                    backgroundColor: PRYMARY_COLOR),
                child: Text("Registrate"),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50)),
            Container(
              child: Text("TODO LO QUE NECESITAS PARA TU FIESTAS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: PRYMARY_COLOR)),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            Container(
                child: Text(
                    "LLEVAMOS TUS PRODUCTOS HASTA LA PUERTA DE TU CASA, TENEMOS TODA LA COCTELERIA DE PISTOLS PITS",
                    style: TextStyle(color: SECONDARY_COLOR)))
          ],
        ),
      ),
    );
  }
}
