import 'dart:developer';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';
import '../home.dart';

class ProductDetail extends StatefulWidget {
  final assetPath, price, productname, detail;

  ProductDetail({this.assetPath, this.price, this.productname, this.detail});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counterValue = 0;
  String t = "texto";

  void addToCar(List<String> bag) async {
    print(bag.toString());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var b = await pref.getStringList('shoppingbag');
    var newgfgList = [];
    if (b == null) {
      if (bag[3] != 0) {
        newgfgList = bag;
        t = "Articulo agregado";
      } else {
        t = "Falta agregar cantidad";
      }
    } else {
      if (bag[3] != 0) {
        newgfgList = b! + bag;
        t = "Articulo agregado";
      } else {
        t = "Falta agregar cantidad";
      }
    }

    await pref.setStringList('shoppingbag', newgfgList as List<String>);

    showAlertDialog(context);
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
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
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
          child: Text('Detalle',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Hero(
            tag: widget.assetPath,
            child: Image.asset(widget.assetPath,
                height: 350, width: 300.0, fit: BoxFit.contain)),
        SizedBox(height: 10.0),
        Center(
          child: Text(widget.price,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: PRYMARY_COLOR)),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(widget.productname,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(widget.detail,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        Center(
          child: CounterButton(
            loading: false,
            onChange: (int val) {
              setState(() {
                _counterValue = val;
              });
            },
            count: _counterValue,
            countColor: Colors.black,
            buttonColor: PRYMARY_COLOR,
            progressColor: PRYMARY_COLOR,
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: PRYMARY_COLOR),
                child: Center(
                    child: TextButton(
                        onPressed: () {
                          List<String> bag = [
                            widget.assetPath,
                            widget.productname,
                            widget.price,
                            _counterValue.toString()
                          ];
                          addToCar(bag);
                        },
                        child: Text('Add to cart',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))))))
      ]),
    );
  }
}
