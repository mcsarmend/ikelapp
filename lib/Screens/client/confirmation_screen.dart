import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import '../home.dart';

class ConfirmationScreen extends StatefulWidget {
  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  String txt = "";

  @override
  void initState() {
    super.initState();
    getOrderName();
  }

  Future getOrderName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var orderName = await pref.getString('internalId');
    setState(() {
      txt =
          'Tu págo fue realizado correctamente, en la sección de pedidos podrás seguir tu compra con la clave de rastreo ' +
              orderName.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/ikellogo.png'),
            Icon(
              Icons.check_circle,
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              '¡Gracias por tu compra!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      txt,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(PRYMARY_COLOR),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setString("internalId", "");
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Sigue comprando'),
            ),
            /* ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(PRYMARY_COLOR),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setString("internalId", "");
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen()),
                );
              },
              child: Text('Rastrear tu pedido'),
            ), */
          ],
        ),
      ),
    );
  }
}
