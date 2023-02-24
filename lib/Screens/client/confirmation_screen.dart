import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ikelapp/constant.dart';
import 'package:ikelapp/screens/client/orders_screen.dart';

import '../home.dart';

class ConfirmationScreen extends StatelessWidget {
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
                      'Tu págo fue realizado correctamente, en la sección de pedidos podrás seguir tu compra con la clave de rastreo XXXXXXXX',
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
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Sigue comprando'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(PRYMARY_COLOR),
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen()),
                );
              },
              child: Text('Rastrear tu pedido'),
            ),
          ],
        ),
      ),
    );
  }
}
