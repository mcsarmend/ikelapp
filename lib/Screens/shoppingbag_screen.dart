import 'package:flutter/material.dart';
import 'package:blogapp/screens/home.dart';
import 'package:blogapp/models/address.dart';
import 'package:blogapp/models/api_response.dart';
import 'package:blogapp/models/user.dart';
import 'package:blogapp/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';

class shoppingbag extends StatefulWidget {
  @override
  State<shoppingbag> createState() => _shoppingbagState();
}

class _shoppingbagState extends State<shoppingbag> {
  int userId = 0;
  User? user;
  User? email;
  bool loading = true;
  String location = "Sin ubicación";
  void getUser() async {
    ApiResponse response = await getUserDetail();
    userId = await getUserId();
    ApiResponse res = await getaddress(userId.toString());

    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;

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
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Home()),
                (route) => false);
          },
        ),
        title: Text('',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Carrito de compras',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Carrito \$: ",
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: SECONDARY_COLOR)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Envío \$: 50.00 ",
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: SECONDARY_COLOR)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Dirección de entrega: ",
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: SECONDARY_COLOR)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(location,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700])),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Total a pagar \$",
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700])),
        ),
        SizedBox(height: 10.0),
        Container(
          color: PRYMARY_COLOR,
          child: TextButton(
              onPressed: () {},
              child: Text('Comprar',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        )
      ]),
    );
  }
}
