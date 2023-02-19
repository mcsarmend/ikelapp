import 'package:flutter/material.dart';
import 'package:ikelapp/screens/client/tracking_screen.dart';
import 'package:ikelapp/screens/home.dart';
import 'package:ikelapp/models/address.dart';
import 'package:ikelapp/models/api_response.dart';
import 'package:ikelapp/models/user.dart';
import 'package:ikelapp/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';

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
  String description = "";
  String carrito = "";
  String t = "";
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

  void setOrderBag() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var bag = await pref.getStringList('shoppingbag');
    if (bag != null) {
      int j = 0;
      String d = "";
      int c = 0;
      for (var i = 0; i < bag.length; i++) {
        if (j == 1) {
          d = d + bag[i].toString();
        }
        if (j == 3) {
          d = d + "( " + bag[i] + " ),";
        }
        if (j == 2) {
          var co = bag[i];
          var cost = int.tryParse(co.substring(1, co.length - 3));
          c += cost!;
        }
        j++;
        if (j == 4) j = 0;
      }

      setState(() {
        description = d;
        carrito = "Carrito: \$" + c.toString();
      });
    }
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
      content: Text(""),
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

  void buy(BuildContext context) {
    if (carrito == "") {
      setState(() {
        t = "No tienes nada en el carrito";
      });
      showAlertDialog(context);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => tracking()),
          (route) => false);
    }
  }

  @override
  void initState() {
    getUser();
    setOrderBag();
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
          child: Text(description,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: SECONDARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(carrito,
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
          padding: EdgeInsets.only(left: 20.0),
          child: TextButton(
              onPressed: () {
                buy(context);
              },
              child: Text('Comprar',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
        ),
        SizedBox(height: 10.0),
        Container(
          color: PRYMARY_COLOR,
          padding: EdgeInsets.only(left: 20.0),
          child: TextButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setStringList('shoppingbag', []);
                setState(() {
                  t = "Carrito vaciado";
                  description = "";
                  carrito = "";
                });
                showAlertDialog(context);
              },
              child: Text('Vaciar carrito',
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
